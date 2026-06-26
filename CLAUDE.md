# CLAUDE.md

This file guides AI assistants (Claude Code and others) working in this repository.

## Project Overview

**Match Get It! (매치 기릿!)** is a location-based sports-field matching web
application. It lets users find nearby people to play matches with and book
sports fields (stadiums) without the usual hassle of manually searching and
reserving. It was built as a Korean team project; **comments, UI strings, and
many identifiers are in Korean** — keep new code consistent with that style.

The app covers: member sign-up/login (including Naver social login and SMS/email
verification), ID/password recovery, a location-based matching flow, a match
board (community board with file attachments and paging), stadium data, and an
admin page with member management and CSV export.

## Tech Stack

- **Language:** Java (Jakarta/Java EE Servlet API `javax.servlet`, web-app 4.0)
- **View layer:** JSP + CSS (no SPA framework; server-rendered pages)
- **Server:** Apache Tomcat (config in `src/server.xml`, `src/context.xml`)
- **Database:** Oracle (`oracle.jdbc.OracleDriver`), accessed via a JNDI
  connection pool `DataSource` named `oracleSource`
- **External APIs:** Naver Login API, SMS API, map/road APIs (in JSP under
  `APISource/`, `API/`, `Map/`)
- **IDE / build:** **Eclipse Dynamic Web Project** — there is **no Maven or
  Gradle**. Do not add `pom.xml`/`build.gradle` unless explicitly asked.

## Repository Layout

```
.
├── src/
│   ├── context.xml            # Tomcat per-app Context: links the oracleSource DataSource
│   ├── server.xml             # Tomcat server config incl. the Oracle JNDI Resource (dev creds)
│   └── main/
│       ├── java/              # Servlets, DAO/DTO, utilities (see packages below)
│       └── webapp/            # JSP views, CSS, images, WEB-INF/web.xml
├── bin/                       # Eclipse compiled output (generated)
├── build/classes/            # Compiled classes (generated)
├── Diagram/                   # Class diagrams (.mdj StarUML), ERD images
├── Document/                  # Requirements, use-case specs, table design notes (xlsx/docx/txt)
├── Ex DB.csv                  # Example stadium dataset (public-data import; CP949/EUC-KR encoded)
├── Servers/                   # Eclipse server runtime config
├── README.md                  # Project intro (Korean)
└── CLAUDE.md                  # This file
```

### Java packages (`src/main/java/`)

| Package | Responsibility |
|---|---|
| `common` | `ConnectDB` — base class that opens/closes the JNDI `Connection`. **All DAOs extend it.** |
| `member` | `MemberDAO`, `MemberDTO` — member CRUD, login state, member listing/paging |
| `match` | `MatchDAO`, `MatchDTO` — match records |
| `matchBoard` | Match-board MVC: `ListController`, `ViewController`, `WriteController`, `EditController`, `PassController`, `DownloadController`, plus `MBoardDAO`/`MBoardDTO` |
| `stadium` | `StadiumDAO`, `StadiumDTO` — sports field data |
| `tempLocation` | `TempLocationDAO`, `TempLocationDTO` — location data for matching |
| `servlet` | The bulk of feature controllers (login, signup, find id/pw, matching flow, admin, etc.) |
| `NaverLoginAPI` | `CallBack`, `FindInfo` — Naver OAuth helpers |
| `util` | `AlertFunction` (JS alert/redirect helpers), `FileUtil` (uploads), `PagingUtil` (pagination HTML) |

### Web views (`src/main/webapp/`)

JSPs are grouped by feature folder: `Login/`, `SignUp/`, `Find/`, `Title/`,
`Matching/`, `MatchBoard/`, `Board/`, `AdminPage/`, `Header/`, `Map/`, `API/`,
`APISource/`, `CheckAuth/`. Shared assets live in `css/` and `img/`.
`WEB-INF/web.xml` holds the deployment descriptor.

## Architecture & Conventions

This is a classic **Model 2 (MVC) Servlet/JSP** app. Follow the existing pattern
when adding features:

1. **Controller = Servlet** mapped with a `@WebServlet` annotation (URLs are
   **not** declared in `web.xml`; they live on the class). Most endpoints end in
   `.do`, e.g. `@WebServlet("/Login/LoginController.do")`,
   `@WebServlet("/matchBoard/list.do")`. A few omit `.do`
   (`/DBRenewController`, `/NickNameCheckController`).
2. **DAO** extends `common.ConnectDB`, uses the inherited `con` / `psmt` / `rs`
   fields with `PreparedStatement`, and **must call `close()`** when done to
   return the pooled connection.
3. **DTO** is a plain POJO (package-private fields + getters/setters).
4. **View:** Controllers populate request/session attributes then
   `request.getRequestDispatcher("/Some/View.jsp").forward(...)`. For quick
   client-side feedback they use `util.AlertFunction.alertBack(...)` /
   `alertLocation(...)` to emit an inline `<script>alert()</script>`.

Other conventions:
- **Request/response encoding** is forced to UTF-8 by the
  `SetCharacterEncodingFilter` filter in `web.xml` (mapped to `/*`).
- **DB access** never uses `DriverManager`; always go through the JNDI lookup in
  `ConnectDB` (`java:comp/env` → `oracleSource`).
- **Session:** the logged-in user is stored as session attribute `dto`
  (a `MemberDTO`). `M_TYPECODE` / member type distinguishes normal user vs admin
  (admin path uses type/state `2`).
- **Paging:** use `util.PagingUtil` and read page-size init params (e.g.
  `PAGE_SIZE`, `PAGING_BLOCK`) from the servlet context.
- **Korean naming/comments** are the norm; match the surrounding file.

## Database

- Schema design notes: `Document/프로젝트 테이블 구상(2023.04.18).txt`. ERD images
  and `.mdj` (StarUML) diagrams are under `Diagram/`.
- Core tables include `MEMBER` (with `SEQ_MEMBER_NUM` sequence), `TYPE`,
  `MATCH`, `STADIUM`/`STARDIUM`, and location tables (`LOCATION`, `AREA`,
  `PLACE`). SQL is Oracle dialect (`SYSDATE`, `NEXTVAL`, `ROW_NUMBER() OVER`).
- The DataSource is defined in `src/server.xml` (`<Resource name="oracleSource"
  ... url="jdbc:oracle:thin:@<host>:1521:xe" username="dev" password="1234">`)
  and exposed to the app via `<ResourceLink>` in `src/context.xml`. These are
  **local dev credentials** — do not treat them as production secrets, and do
  not commit real secrets.

## Building & Running

There is no CLI build script in the repo; it is meant to run from Eclipse with a
Tomcat server runtime:

1. Import as an existing Eclipse project (`.project` / `.classpath` provided).
2. Ensure the Oracle JDBC driver and Servlet API are on the server classpath,
   and that Tomcat has the `oracleSource` JNDI DataSource configured (mirror
   `src/server.xml` / `src/context.xml`).
3. Run on the configured Tomcat server; the welcome flow starts from the
   JSP welcome files (`index.jsp`, etc.) / `Title/TitleMain.jsp`.

> Note: `.classpath` references source folders (`공승환/...`, `양선영/...`) that no
> longer exist in the tree — historical team layout. Don't rely on them.

## Working in This Repo (Guidance for AI Assistants)

- **Match the existing style**: same MVC layering, `@WebServlet` annotations,
  DAO-extends-`ConnectDB`, DTO POJOs, Korean comments/strings.
- **Don't introduce a build system, framework, or major refactor** unless asked.
- **Security caveats — be careful, and prefer fixing over copying:** some
  existing DAOs build SQL by **string concatenation of request params** (e.g.
  search filters in `MemberDAO.getMemberList`), which is SQL-injection-prone.
  Passwords appear to be stored/compared in plaintext. When you add or touch
  data access, use **parameterized `PreparedStatement` placeholders** and avoid
  echoing unsanitized input. Flag, don't silently propagate, these patterns.
- **Generated/binary artifacts** (`bin/`, `build/classes/`, `.DS_Store`, `.mdj`,
  office docs, the large `Ex DB.csv`) are not source — don't edit them by hand.
  `*.class`, `*.log`, `*.jar`/`*.war` are git-ignored.
- **Encoding:** Korean files are UTF-8; `Ex DB.csv` is a legacy CP949/EUC-KR
  export and will look garbled as UTF-8 — convert when reading, don't "fix" it
  in place.

## Git Workflow

- Active development branch for current work: `claude/claude-md-docs-faaqjw`
  (default branch is `master`).
- Make focused commits with clear messages. Only open a pull request when
  explicitly requested.
