# lic

A template-based license generator script in Perl

## Licenses

lic provides license templates for the following licenses:

### OSI or FSF approved

|Name|ID|SPDX Identifier|
|-|-|-|
|GNU Affero General Public License v3.0 or later|`agpl3`|`AGPL-3.0-or-later`|
|Apache 2.0|`apache2`|`Apache-2.0`|
|BSD Zero Clause License|`bsd0`|`0BSD`|
|BSD 1-Clause License|`bsd1`|`BSD-1-Clause`|
|BSD 2-Clause "Simplified" License|`bsd2`|`BSD-2-Clause`|
|BSD 3-Clause "Revised" License|`bsd3`|`BSD-3-Clause`|
|Boost Software License 1.0|`bsl`|`BSL-1.0`|
|Creative Commons Zero v1.0 Universal|`cc0`|`CC0-1.0`|
|Eclipse Public License 2.0|`epl2`|`EPL-2.0`|
|European Union Public License 1.2|`eupl`|`EUPL-1.2`|
|GNU General Public License v2.0 or later|`gpl2`|`GPL-2.0-or-later`|
|GNU General Public License v3.0 or later|`gpl3`|`GPL-3.0-or-later`|
|ISC License|`isc`|`ISC`|
|GNU Lesser General Public License v2.1 or later|`lgpl2.1`|`LGPL-2.1-or-later`|
|GNU Lesser General Public License v3.0 or later|`lgpl3`|`LGPL-3.0-or-later`|
|MIT License|`mit`|`MIT`|
|Mozilla Public License 2.0|`mpl2`|`MPL-2.0`|
|The Unlicense|`unlicense`|`Unlicense`|
|Do What The F*ck You Want To Public License|`wtfpl`|`WTFPL`|

### Media

|Name|ID|SPDX Identifier|
|-|-|-|
|Creative Commons Attribution 4.0 International|`cc_by4`|`CC-BY-4.0`|
|Creative Commons Attribution Non Commercial 4.0 International|`cc_by_nc4`|`CC-BY-NC-4.0`|
|Creative Commons Attribution Non Commercial No Derivatives 4.0 International|`cc_by_nc_nd4`|`CC-BY-NC-ND-4.0`|
|Creative Commons Attribution Non Commercial Share Alike 4.0 International|`cc_by_nc_sa4`|`CC-BY-NC-SA-4.0`|
|Creative Commons Attribution No Derivatives 4.0 International|`cc_by_nd4`|`CC-BY-ND-4.0`|
|Creative Commons Attribution Share Alike 4.0 International|`cc_by_sa4`|`CC-BY-SA-4.0`|

### Others

|Name|ID|SPDX Identifier|
|-|-|-|
|Good Luck With That Public License|`glwtpl`|`GLWTPL`|
|Good Luck With That Sh*t Public License|`glwtspl`||

## Adding Licenses

If you want a license added to this repository, make a pull request, follow
naming conventions and make sure to add it to the table above.

If you want a license for personal use, place it in one of the following
locations under the identifier name:

- anywhere under the `LICPATH` environment variable
- `~/.local/share/lic`
- `/usr/share/lic`

For example, if you had license `xxx`, you could place it at
`~/.local/share/lic/xxx`. License headers have the `.head` extension, so
use `~/.local/share/lic/xxx.head` for the `xxx` header.

