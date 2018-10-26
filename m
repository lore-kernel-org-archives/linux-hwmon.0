Return-Path: <linux@rasmusvillemoes.dk>
Return-path: <linux@rasmusvillemoes.dk>
From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
To: Kees Cook <keescook@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	linux-nfs@vger.kernel.org,
	Trond Myklebust <trond.myklebust@hammerspace.com>,
	linux-hwmon@vger.kernel.org,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	"Steven Rostedt (VMware)" <rostedt@goodmis.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Subject: [RFC PATCH 0/7] runtime format string checking
Date: Sat, 27 Oct 2018 01:24:02 +0200
Message-Id: <20181026232409.16100-1-linux@rasmusvillemoes.dk>
In-Reply-To: <20171108223020.24487-1-linux@rasmusvillemoes.dk>
References: <20171108223020.24487-1-linux@rasmusvillemoes.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-ID: <linux-hwmon@vger.kernel.org>

This is a resurrection of something I sent out about a year ago. In
the relatively few places where we use a non-literal as format string,
we can annotate the source with a fmtcheck() call that will (a) at
build time, allow the compiler to check the variadic arguments against
the template, and (b) at runtime, check that the format specifiers
present in the actual format string match those in the template (and
if not, WARN and use the template to ensure runtime type safety).

Finding places to annotate is just

  make -j8 KCFLAGS='-Wformat-nonliteral'

So far, in about half the places I looked, one might as well get
completely rid of the non-literal format string. Patches 5,6,7 are
some examples of where one might add fmtcheck() calls. I don't think
we can get to a state where we can unconditionally add
-Wformat-nonliteral to the build, but I think there's a lot of
low-hanging fruit.

This is on top of Miguel's compiler attributes series [1], which I
hope will land in mainline soon.

[1] https://github.com/ojeda/linux.git tags/compiler-attributes-for-linus-4.20-rc1

Rasmus Villemoes (7):
  compiler_attributes.h: add __attribute__((format_arg)) shorthand
  lib/vsprintf.c: add fmtcheck utility
  kernel.h: implement fmtmatch() wrapper around fmtcheck()
  lib/test_printf.c: add a few fmtcheck() test cases
  kernel/kthread.c: do runtime check of format string in
    kthread_create_on_cpu()
  nfs: use fmtcheck() in root_nfs_data
  drivers: hwmon: add runtime format string checking

 drivers/hwmon/hwmon.c               |  3 +-
 fs/nfs/nfsroot.c                    |  2 +-
 include/linux/compiler_attributes.h | 13 ++++++
 include/linux/kernel.h              | 25 +++++++++++
 kernel/kthread.c                    |  4 +-
 lib/Kconfig.debug                   |  9 ++++
 lib/test_printf.c                   | 43 +++++++++++++++++++
 lib/vsprintf.c                      | 65 +++++++++++++++++++++++++++++
 8 files changed, 160 insertions(+), 4 deletions(-)

-- 
2.19.1.6.gbde171bbf5
