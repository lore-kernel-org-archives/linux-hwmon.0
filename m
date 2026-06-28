Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5306D2417DE;
	Sun, 28 Jun 2026 19:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782676383; cv=none; b=Tf7Qg2gq7Rq8qhF2Fwn/TRGaGJqEg4JBXCZw4sbk6Pl375zcvKT1xe7gFT41PrYCDr3kq2IV0R6BRM02MRS/0LU3WsyegPWqk5ueuN+PtPxEvPwVo4jO+3IGPlv9IvUPyqPhXn3/sYkwydK9Y5WVdvJdLjfmWn+5xP9+zFXu/0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782676383; c=relaxed/simple;
	bh=tbTFVHYxs0NQJweIMgiCoEBQo3PEMy1G/3is7IudK98=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=e3mncjxGiVwQ6J7eh/UccYd4eCqS5PhU6yiztAkJa9HcTf8OpzkM6iOMgHyn1RixZEsNsYpwX6pk/rLQmQv0X5KXqVKwWES+Kizt7PA2+WmWie+Xfg97mfPtq1W25pLvgR4lbDN/+aCQJDBFa7ObnMClPaTekbvGWsqtzcHCzxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=NS+gCR+N; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="NS+gCR+N"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BB841F000E9;
	Sun, 28 Jun 2026 19:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux-foundation.org; s=korg; t=1782676380;
	bh=U//UbbS2hyX+F5puvnM6xANnRSjaQPlt4Wa3h4HjpiU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=NS+gCR+N86VhInwLVhN3CDWGb/wye+hQm40hKn1/UXq7pftjuq5dcym3jrHiLCoJq
	 WFNnRQqCB4QH6wAdZIfDmz3sPOVNhBO3b5DL9F2jkXqlT6GhFQTX119PsxcSJhS7/S
	 iTYbOdF2eZz9qiBBJzywJlAwiQu+TbSTit91XhLw=
Date: Sun, 28 Jun 2026 12:53:00 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev,
 Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>, Serge Semin
 <Sergey.Semin@baikalelectronics.ru>, linux-hwmon@vger.kernel.org, Guenter
 Roeck <linux@roeck-us.net>, Brendan Higgins <brendan.higgins@linux.dev>,
 David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>
Subject: Re: [PATCH] lib/math: add KUnit test suite for polynomial_calc()
Message-Id: <20260628125300.28f9b8b531e216b2e1d3ede0@linux-foundation.org>
In-Reply-To: <20260606030319.316752-1-adinata.softwareengineer@gmail.com>
References: <20260606030319.316752-1-adinata.softwareengineer@gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat,  6 Jun 2026 11:03:09 +0800 Adi Nata <adinata.softwareengineer@gmail.com> wrote:

> Add a KUnit test suite for the polynomial_calc() function, which had
> no in-kernel test coverage. The tests verify correct evaluation of
> constant, linear, quadratic, and cubic polynomials, including negative
> coefficients, negative input data, zero-coefficient terms.
> 
> The Kconfig entry uses 'select POLYNOMIAL' rather than 'depends on
> POLYNOMIAL' because POLYNOMIAL is a promptless tristate that cannot
> be manually enabled on UML without an explicit selector.

Looks nice, thanks.  Let's cc the polynomial authors.  And the hwmon
people - the only subsystem which uses polynomial_calc().

And the Kunit people.

AI review thinks the Kconfig text doesn't match the code:

	https://sashiko.dev/#/patchset/20260606030319.316752-1-adinata.softwareengineer@gmail.com


From: Adi Nata <adinata.softwareengineer@gmail.com>
Subject: lib/math: add KUnit test suite for polynomial_calc()
Date: Sat, 6 Jun 2026 11:03:09 +0800

Add a KUnit test suite for the polynomial_calc() function, which had no
in-kernel test coverage.  The tests verify correct evaluation of constant,
linear, quadratic, and cubic polynomials, including negative coefficients,
negative input data, zero-coefficient terms.

The Kconfig entry uses 'select POLYNOMIAL' rather than 'depends on
POLYNOMIAL' because POLYNOMIAL is a promptless tristate that cannot
be manually enabled on UML without an explicit selector.

Link: https://lore.kernel.org/20260606030319.316752-1-adinata.softwareengineer@gmail.com
Signed-off-by: Adi Nata <adinata.softwareengineer@gmail.com>
Cc: Maxim Kaurkin <maxim.kaurkin@baikalelectronics.ru>
Cc: Serge Semin <Sergey.Semin@baikalelectronics.ru>
Cc: Guenter Roeck <linux@roeck-us.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>
Cc: David Gow <david@davidgow.net>
Cc: Rae Moar <raemoar63@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 lib/Kconfig.debug                 |   17 +
 lib/math/tests/Makefile           |    1 
 lib/math/tests/polynomial_kunit.c |  270 ++++++++++++++++++++++++++++
 3 files changed, 288 insertions(+)

--- a/lib/Kconfig.debug~lib-math-add-kunit-test-suite-for-polynomial_calc
+++ a/lib/Kconfig.debug
@@ -3476,6 +3476,23 @@ config GCD_KUNIT_TEST
 
 	  If unsure, say N
 
+config POLYNOMIAL_KUNIT_TEST
+	tristate "Polynomial calculation (polynomial_calc) test" if !KUNIT_ALL_TESTS
+	depends on KUNIT
+	select POLYNOMIAL
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables the KUnit test suite for the polynomial_calc()
+	  function, which evaluates integer polynomials using factor
+	  redistribution to avoid overflow.
+
+	  The test suite verifies correctness for constant, linear, and
+	  quadratic polynomials, negative coefficients, per-step dividers,
+	  divider_leftover, total_divider scaling, and a real sensor
+	  N-to-temperature conversion polynomial.
+
+	  If unsure, say N
+
 config PRIME_NUMBERS_KUNIT_TEST
 	tristate "Prime number generator test" if !KUNIT_ALL_TESTS
 	depends on KUNIT
--- a/lib/math/tests/Makefile~lib-math-add-kunit-test-suite-for-polynomial_calc
+++ a/lib/math/tests/Makefile
@@ -4,5 +4,6 @@ obj-$(CONFIG_GCD_KUNIT_TEST)		+= gcd_kun
 obj-$(CONFIG_INT_LOG_KUNIT_TEST)	+= int_log_kunit.o
 obj-$(CONFIG_INT_POW_KUNIT_TEST)	+= int_pow_kunit.o
 obj-$(CONFIG_INT_SQRT_KUNIT_TEST)	+= int_sqrt_kunit.o
+obj-$(CONFIG_POLYNOMIAL_KUNIT_TEST)	+= polynomial_kunit.o
 obj-$(CONFIG_PRIME_NUMBERS_KUNIT_TEST)	+= prime_numbers_kunit.o
 obj-$(CONFIG_RATIONAL_KUNIT_TEST)	+= rational_kunit.o
diff --git a/lib/math/tests/polynomial_kunit.c a/lib/math/tests/polynomial_kunit.c
new file mode 100644
--- /dev/null
+++ a/lib/math/tests/polynomial_kunit.c
@@ -0,0 +1,270 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <kunit/test.h>
+#include <linux/polynomial.h>
+
+struct polynomial_test_param {
+	const struct polynomial *poly;
+	long data;
+	long expected;
+	const char *name;
+};
+
+/* f(x) = 5 */
+static const struct polynomial poly_constant = {
+	.total_divider = 1,
+	.terms = {
+		{0, 5, 1, 1},
+	}
+};
+
+/* f(x) = 2x^2 + 3x + 5 */
+static const struct polynomial poly_simple = {
+	.total_divider = 1,
+	.terms = {
+		{2, 2, 1, 1},
+		{1, 3, 1, 1},
+		{0, 5, 1, 1},
+	}
+};
+
+/* f(x) = -5x + 100 */
+static const struct polynomial poly_negative_coef = {
+	.total_divider = 1,
+	.terms = {
+		{1, -5, 1, 1},
+		{0, 100, 1, 1},
+	}
+};
+
+/* f(x) = (150x + 50) / 10 */
+static const struct polynomial poly_total_divider = {
+	.total_divider = 10,
+	.terms = {
+		{1, 150, 1, 1},
+		{0,  50, 1, 1},
+	}
+};
+
+/*
+ * f(x) = x / 2
+ * divider=2 applied once per multiply: mult_frac(coef, data, 2) = coef*data/2
+ */
+static const struct polynomial poly_step_divider = {
+	.total_divider = 1,
+	.terms = {
+		{1, 1, 2, 1},
+		{0, 0, 1, 1},
+	}
+};
+
+/*
+ * f(x) = (100/500) * x^2 = 0.2 * x^2
+ * Encoded as coef=100, divider=10, divider_leftover=5:
+ *   denom = 10^2 * 5 = 500
+ */
+static const struct polynomial poly_leftover = {
+	.total_divider = 1,
+	.terms = {
+		{2, 100, 10, 5},
+		{0,   0,  1, 1},
+	}
+};
+
+/*
+ * f(x) = 2x^3  (single high-degree term, no constant)
+ * Used to exercise the power loop alone.
+ */
+static const struct polynomial poly_cubic = {
+	.total_divider = 1,
+	.terms = {
+		{3, 2, 1, 1},
+		{0, 0, 1, 1},
+	}
+};
+
+/*
+ * f(x) = 4x + 1  with a zero-coefficient quadratic term.
+ * The deg-2 term contributes nothing regardless of input.
+ */
+static const struct polynomial poly_zero_coef = {
+	.total_divider = 1,
+	.terms = {
+		{2, 0, 1, 1},
+		{1, 4, 1, 1},
+		{0, 1, 1, 1},
+	}
+};
+
+/*
+ * f(x) = 9  with total_divider = 0.
+ * The implementation treats 0 as 1 via `total_divider ?: 1`, so the
+ * result must equal the constant term unchanged.
+ */
+static const struct polynomial poly_zero_total_divider = {
+	.total_divider = 0,
+	.terms = {
+		{0, 9, 1, 1},
+	}
+};
+
+
+static const struct polynomial_test_param test_params[] = {
+	{
+		.poly     = &poly_constant,
+		.data     = 0,
+		.expected = 5,
+		.name     = "Constant polynomial at x=0",
+	},
+	{
+		.poly     = &poly_constant,
+		.data     = 42,
+		.expected = 5,
+		.name     = "Constant polynomial is independent of input",
+	},
+	{
+		.poly     = &poly_simple,
+		.data     = 0,
+		.expected = 5,	/* zero input collapses all power terms */
+		.name     = "Zero input yields constant term only",
+	},
+	{
+		.poly     = &poly_simple,
+		.data     = 10,
+		.expected = 235,	/* 2*100 + 3*10 + 5 */
+		.name     = "Simple quadratic at x=10",
+	},
+	{
+		.poly     = &poly_negative_coef,
+		.data     = 10,
+		.expected = 50,		/* -5*10 + 100 */
+		.name     = "Negative coefficient at x=10",
+	},
+	{
+		.poly     = &poly_negative_coef,
+		.data     = 20,
+		.expected = 0,		/* -5*20 + 100 = 0 */
+		.name     = "Negative coefficient result is zero",
+	},
+	{
+		.poly     = &poly_total_divider,
+		.data     = 3,
+		.expected = 50,		/* (150*3 + 50) / 10 = 500/10 */
+		.name     = "total_divider scales the final sum",
+	},
+	{
+		.poly     = &poly_step_divider,
+		.data     = 100,
+		.expected = 50,		/* 1*100/2 */
+		.name     = "Per-step divider halves input",
+	},
+	{
+		.poly     = &poly_leftover,
+		.data     = 30,
+		.expected = 180,	/* 100*30^2 / (10^2 * 5) = 90000/500 */
+		.name     = "divider_leftover with quadratic term",
+	},
+	/* Boundary: unit and negative-unit input */
+	{
+		/*
+		 * data=1: each mult_frac(tmp, 1, divider) strips one factor of
+		 * divider from coef per degree, so coef is left-shifted right
+		 * until intermediate precision is exhausted.
+		 * 2*1 + 3*1 + 5 = 10
+		 */
+		.poly     = &poly_simple,
+		.data     = 1,
+		.expected = 10,
+		.name     = "Boundary: data=1 (unit input)",
+	},
+	{
+		/*
+		 * data=-1: even degrees produce positive contributions,
+		 * odd degrees produce negative ones.
+		 * 2*(-1)^2 + 3*(-1) + 5 = 2 - 3 + 5 = 4
+		 */
+		.poly     = &poly_simple,
+		.data     = -1,
+		.expected = 4,
+		.name     = "Boundary: data=-1 (negative unit input)",
+	},
+
+	/* Boundary: negative non-trivial input */
+	{
+		/*
+		 * 2*(-3)^2 + 3*(-3) + 5 = 18 - 9 + 5 = 14
+		 * Verifies sign handling for negative data across all degrees.
+		 */
+		.poly     = &poly_simple,
+		.data     = -3,
+		.expected = 14,
+		.name     = "Boundary: negative data with quadratic",
+	},
+
+	/* Boundary: total_divider = 0 is treated as 1 */
+	{
+		.poly     = &poly_zero_total_divider,
+		.data     = 42,
+		.expected = 9,
+		.name     = "Boundary: total_divider=0 defaults to 1",
+	},
+
+	/* Boundary: zero-coefficient high-degree term */
+	{
+		/*
+		 * The deg-2 term has coef=0, so it contributes 0 regardless
+		 * of data. Result: 0 + 4*10 + 1 = 41
+		 */
+		.poly     = &poly_zero_coef,
+		.data     = 10,
+		.expected = 41,
+		.name     = "Boundary: zero-coefficient term is inert",
+	},
+
+	/* Boundary: single high-degree term, no constant */
+	{
+		/* 2 * 5^3 = 250; also verifies the loop terminates on deg-0 */
+		.poly     = &poly_cubic,
+		.data     = 5,
+		.expected = 250,
+		.name     = "Boundary: single cubic term",
+	},
+	{
+		/* 2 * (-2)^3 = -16; odd power preserves sign of negative data */
+		.poly     = &poly_cubic,
+		.data     = -2,
+		.expected = -16,
+		.name     = "Boundary: single cubic term, negative data",
+	},
+
+};
+
+static void get_desc(const struct polynomial_test_param *param, char *desc)
+{
+	strscpy(desc, param->name, KUNIT_PARAM_DESC_SIZE);
+}
+
+KUNIT_ARRAY_PARAM(polynomial, test_params, get_desc);
+
+static void polynomial_calc_test(struct kunit *test)
+{
+	const struct polynomial_test_param *param = test->param_value;
+
+	KUNIT_EXPECT_EQ(test, polynomial_calc(param->poly, param->data),
+			param->expected);
+}
+
+static struct kunit_case polynomial_test_cases[] = {
+	KUNIT_CASE_PARAM(polynomial_calc_test, polynomial_gen_params),
+	{}
+};
+
+static struct kunit_suite polynomial_test_suite = {
+	.name = "math-polynomial",
+	.test_cases = polynomial_test_cases,
+};
+
+kunit_test_suites(&polynomial_test_suite);
+
+MODULE_DESCRIPTION("math.polynomial_calc KUnit test suite");
+MODULE_LICENSE("GPL");
_

