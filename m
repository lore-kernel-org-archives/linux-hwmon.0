Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD5E7485CD8;
	Wed, 14 Oct 2026 08:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791964802; cv=none; b=JMYXYWrZTz5NEQZmflRRFbgIMcVbFJLAd4AxHHnMaXlHVKKX4tFYgN2+SSeNAWnl6s5962bt05v2V1pG/6JtfogTZvoDAT3HN1eP4xPMJoYihz3QXQotZsOEfI5nPqwqPqTbsQP2cu5F5d3D6mn5aLr49v5XCyLUdmV6NRDIHTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791964802; c=relaxed/simple;
	bh=JcsNyUTum3gght6MaxO8G0xouWm3pIf9cr4IOEwyQ1Q=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=N/t89zQR9qEr0naMB6KbSiquGRIoj/msyqCQIbkR/QiBn95M/HeMhRACUvWx2Kv9zaLTX4VYH1EGAC7Hgzsev2pSx8J/xxKlVc2NFkACEDp3TIEJVhlAAJ4v4RBf1qqwVIvoAfEDV7fFdZjWkIRuYqrXHRUgaHy0SMgVtH2B5MY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WXrUse8R; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WXrUse8R"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791964802; x=1823500802;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=JcsNyUTum3gght6MaxO8G0xouWm3pIf9cr4IOEwyQ1Q=;
  b=WXrUse8RdTE6Zohsf01qxq3zpYk012i/PpSSvq49hZCrEJngXQsNvXpK
   buPYDtm9hY3VhVywQIA9m0MZnUbGa6aW1pGAmvC9aRy+D5ztyalAQRnaA
   PhfMObmltXcgUDtKGVEi6H58cNrEolEhdYvA+2NhQrxrUZjCU3N6Gf4lX
   1pvjNWrINWwWiYt9BC+e4CtkqnaI81/SFbQ2Qcs2Gqvr9h1vMHi1SAsY9
   y5qxjyILuhTlkrdNCGRU8yQJ+tLjOwRA4pttzoSt8e96CNBp2v/Q+Sxky
   2X1i4P7eJyieXQGlyYjd8GVuCZIkFc2O8z0HiVPVeMwR2m52tlyHea2li
   w==;
X-CSE-ConnectionGUID: teLw6qtkSlCU2Vf8H6KKxg==
X-CSE-MsgGUID: CE1vQVodRYSHFD6Ih2MKuQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11934"; a="601674"
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="601674"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 01:00:00 -0700
X-CSE-ConnectionGUID: V6PuobAWQ3qRvYQCNF5cAA==
X-CSE-MsgGUID: cL0AOjnJS8SPbtnvhJD09g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,157,1787036400"; 
   d="scan'208";a="1378690"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.234])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Oct 2026 00:59:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Wed, 14 Oct 2026 10:59:50 +0300 (EEST)
To: Birk Skyum <birk.skyum@pm.me>
cc: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, 
    Sibi Sankar <sibi.sankar@oss.qualcomm.com>, 
    Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, 
    Shuah Khan <skhan@linuxfoundation.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, 
    Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, 
    platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [RFC PATCH v2 2/2] platform: arm64: qcom-hamoa-ec: test sensor
 and variant handling
In-Reply-To: <20260908135801.81436-3-birk.skyum@pm.me>
Message-ID: <77c05024-1742-7106-eb83-a4776f76d397@linux.intel.com>
References: <20260908135801.81436-1-birk.skyum@pm.me> <20260908135801.81436-3-birk.skyum@pm.me>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 8 Sep 2026, Birk Skyum wrote:

> Exercise the sensor callbacks against a simulated I2C adapter. Check
> little-endian RPM decoding, short transfers, malformed byte counts,
> the unavailable-temperature sentinel and propagation of bus errors.
> 
> Check that the Lenovo compatible takes precedence over its reference-
> board fallback, that its sensor attributes are read-only, and that its
> probe and PM/remove callbacks do not issue control writes. Keep coverage
> of the strict reference-board capability-response validation.
> 
> The tests use KUnit and never access a physical EC.
> 
> Signed-off-by: Birk Skyum <birk.skyum@pm.me>
> ---
>  MAINTAINERS                                 |   1 +
>  drivers/platform/arm64/Kconfig              |  12 +
>  drivers/platform/arm64/qcom-hamoa-ec-test.c | 294 ++++++++++++++++++++
>  drivers/platform/arm64/qcom-hamoa-ec.c      |   4 +
>  4 files changed, 311 insertions(+)
>  create mode 100644 drivers/platform/arm64/qcom-hamoa-ec-test.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index c3c208602..53ad3ca48 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22442,6 +22442,7 @@ L:	linux-arm-msm@vger.kernel.org
>  S:	Maintained
>  F:	Documentation/admin-guide/laptops/qcom-ec.rst
>  F:	Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-ec.yaml
> +F:	drivers/platform/arm64/qcom-hamoa-ec-test.c
>  F:	drivers/platform/arm64/qcom-hamoa-ec.c
>  
>  QUALCOMM HEXAGON ARCHITECTURE
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 4f338c715..d940973be 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -105,4 +105,16 @@ config EC_QCOM_HAMOA
>  	  This driver supports Hamoa/Purwa/Glymur reference devices and read-only
>  	  fan speed and temperature monitoring on the Lenovo Yoga Slim 7x.
>  
> +config EC_QCOM_HAMOA_KUNIT_TEST
> +	bool "Tests for the Qualcomm EC driver" if !KUNIT_ALL_TESTS
> +	depends on EC_QCOM_HAMOA && KUNIT && OF
> +	depends on EC_QCOM_HAMOA=m || KUNIT=y
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Test the Qualcomm EC driver's sensor transactions and read-only
> +	  callbacks using a simulated I2C adapter. No physical EC is accessed.
> +	  Run these tests in a disposable test kernel, for example under QEMU.
> +
> +	  If unsure, say N.
> +
>  endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec-test.c b/drivers/platform/arm64/qcom-hamoa-ec-test.c
> new file mode 100644
> index 000000000..68868ef76
> --- /dev/null
> +++ b/drivers/platform/arm64/qcom-hamoa-ec-test.c
> @@ -0,0 +1,294 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Included by qcom-hamoa-ec.c to test its private transport and callbacks. */
> +
> +#include <kunit/resource.h>
> +#include <kunit/test.h>
> +#include <linux/of.h>
> +
> +struct qcom_ec_test_context {
> +	struct i2c_adapter adapter;
> +	struct qcom_ec ec;
> +	u32 functionality;
> +	int transfer_result;
> +	int byte_result;
> +	u8 reply[4];
> +	u8 block_length;
> +	unsigned int transactions;
> +	unsigned int writes;
> +};
> +
> +static int qcom_ec_test_transfer(struct i2c_adapter *adapter,
> +				 struct i2c_msg *messages, int count)
> +{
> +	struct qcom_ec_test_context *ctx = i2c_get_adapdata(adapter);
> +
> +	ctx->transactions++;
> +	/* Only the RPM query's combined write/read transaction is allowed. */
> +	if (count != 2 || messages[0].addr != 0x76 || messages[1].addr != 0x76 ||
> +	    messages[0].flags || messages[1].flags != I2C_M_RD ||
> +	    messages[0].len != 2 || messages[1].len != 3 ||
> +	    messages[0].buf[0] != 0x22 || messages[0].buf[1] != 1) {

Why are you using literals for things that are named on the driver side 
(e.g. that 0x22)?

-- 
 i.

> +		ctx->writes++;
> +		return -EPROTO;
> +	}
> +
> +	if (ctx->transfer_result == 2)
> +		memcpy(messages[1].buf, ctx->reply, messages[1].len);
> +
> +	return ctx->transfer_result;
> +}
> +
> +static s32 qcom_ec_test_smbus(struct i2c_adapter *adapter, u16 address,
> +			      unsigned short flags, char read_write, u8 command,
> +			      int size, union i2c_smbus_data *data)
> +{
> +	struct qcom_ec_test_context *ctx = i2c_get_adapdata(adapter);
> +
> +	ctx->transactions++;
> +	if (read_write != I2C_SMBUS_READ) {
> +		ctx->writes++;
> +		return -EPROTO;
> +	}
> +	if (address != 0x76 || flags)
> +		return -EPROTO;
> +
> +	if (command == 0x29 && size == I2C_SMBUS_BYTE_DATA) {
> +		if (ctx->byte_result < 0)
> +			return ctx->byte_result;
> +		data->byte = ctx->byte_result;
> +		return 0;
> +	}
> +
> +	if ((command == 0x0e || command == 0x42) && size == I2C_SMBUS_I2C_BLOCK_DATA) {
> +		data->block[0] = ctx->block_length;
> +		memcpy(&data->block[1], ctx->reply, ctx->block_length);
> +		return 0;
> +	}
> +
> +	return -EPROTO;
> +}
> +
> +static u32 qcom_ec_test_functionality(struct i2c_adapter *adapter)
> +{
> +	struct qcom_ec_test_context *ctx = i2c_get_adapdata(adapter);
> +
> +	return ctx->functionality;
> +}
> +
> +static const struct i2c_algorithm qcom_ec_test_algorithm = {
> +	.master_xfer = qcom_ec_test_transfer,
> +	.smbus_xfer = qcom_ec_test_smbus,
> +	.functionality = qcom_ec_test_functionality,
> +};
> +
> +static void qcom_ec_test_delete_adapter(void *data)
> +{
> +	i2c_del_adapter(data);
> +}
> +
> +static void qcom_ec_test_unregister_client(void *data)
> +{
> +	i2c_unregister_device(data);
> +}
> +
> +static int qcom_ec_test_init(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx;
> +	int ret;
> +
> +	ctx = kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
> +	KUNIT_ASSERT_NOT_NULL(test, ctx);
> +	test->priv = ctx;
> +	ctx->functionality = I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA |
> +			     I2C_FUNC_SMBUS_READ_I2C_BLOCK;
> +	ctx->transfer_result = 2;
> +	ctx->reply[0] = 2;
> +	ctx->byte_result = 36;
> +	ctx->adapter.owner = THIS_MODULE;
> +	ctx->adapter.algo = &qcom_ec_test_algorithm;
> +	strscpy(ctx->adapter.name, "qcom-ec-kunit", sizeof(ctx->adapter.name));
> +	i2c_set_adapdata(&ctx->adapter, ctx);
> +	ret = i2c_add_adapter(&ctx->adapter);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	ret = kunit_add_action_or_reset(test, qcom_ec_test_delete_adapter, &ctx->adapter);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +
> +	ctx->ec.client = i2c_new_dummy_device(&ctx->adapter, 0x76);
> +	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->ec.client);
> +	ret = kunit_add_action_or_reset(test, qcom_ec_test_unregister_client, ctx->ec.client);
> +	KUNIT_ASSERT_EQ(test, ret, 0);
> +	ctx->ec.variant = &qcom_ec_slim7x;
> +	i2c_set_clientdata(ctx->ec.client, &ctx->ec);
> +
> +	return 0;
> +}
> +
> +static void qcom_ec_rpm_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +	static const struct {
> +		int transfer_result;
> +		u8 count;
> +		int error;
> +	} failures[] = {
> +		{ 0, 2, -EIO },
> +		{ 1, 2, -EIO },
> +		{ -EREMOTEIO, 2, -EREMOTEIO },
> +		{ -ETIMEDOUT, 2, -ETIMEDOUT },
> +		{ 2, 0, -EPROTO },
> +		{ 2, 1, -EPROTO },
> +		{ 2, 3, -EPROTO },
> +		{ 2, 0xff, -EPROTO },
> +	};
> +	long value = -1;
> +	int i;
> +
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read_fan_rpm(&ctx->ec, &value), 0);
> +	KUNIT_EXPECT_EQ(test, value, 0);
> +	ctx->reply[1] = 0xef;
> +	ctx->reply[2] = 0xbe;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read_fan_rpm(&ctx->ec, &value), 0);
> +	KUNIT_EXPECT_EQ(test, value, 0xbeef);
> +
> +	for (i = 0; i < ARRAY_SIZE(failures); i++) {
> +		value = -1;
> +		ctx->transfer_result = failures[i].transfer_result;
> +		ctx->reply[0] = failures[i].count;
> +		KUNIT_EXPECT_EQ_MSG(test, qcom_ec_read_fan_rpm(&ctx->ec, &value),
> +				    failures[i].error, "case %d", i);
> +		KUNIT_EXPECT_EQ(test, value, -1);
> +	}
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +}
> +
> +static void qcom_ec_temperature_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +	static const int temperatures[] = { 0, 36, 254, 255, -EREMOTEIO };
> +	long value;
> +	int i, ret;
> +
> +	for (i = 0; i < ARRAY_SIZE(temperatures); i++) {
> +		value = -1;
> +		ctx->byte_result = temperatures[i];
> +		ret = qcom_ec_hwmon_read(&ctx->ec.client->dev, hwmon_temp,
> +					 hwmon_temp_input, 0, &value);
> +		if (temperatures[i] < 0) {
> +			KUNIT_EXPECT_EQ(test, ret, temperatures[i]);
> +			KUNIT_EXPECT_EQ(test, value, -1);
> +		} else if (temperatures[i] == 255) {
> +			KUNIT_EXPECT_EQ(test, ret, -ENODATA);
> +			KUNIT_EXPECT_EQ(test, value, -1);
> +		} else {
> +			KUNIT_EXPECT_EQ(test, ret, 0);
> +			KUNIT_EXPECT_EQ(test, value, temperatures[i] * 1000);
> +		}
> +	}
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +}
> +
> +static void qcom_ec_read_only_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +	struct device *dev = &ctx->ec.client->dev;
> +	long value = -1;
> +
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_fan, hwmon_fan_input, 0),
> +			0444);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_temp, hwmon_temp_input, 0),
> +			0444);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_fan, hwmon_fan_input, 1), 0);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_pwm, hwmon_pwm_input, 0), 0);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_read(dev, hwmon_fan, hwmon_fan_input, 1, &value),
> +			-EOPNOTSUPP);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_read(dev, hwmon_pwm, hwmon_pwm_input, 0, &value),
> +			-EOPNOTSUPP);
> +	KUNIT_EXPECT_EQ(test, value, -1);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_suspend(dev), 0);
> +	KUNIT_EXPECT_EQ(test, qcom_ec_resume(dev), 0);
> +	qcom_ec_remove(ctx->ec.client);
> +	KUNIT_EXPECT_EQ(test, ctx->transactions, 0);
> +}
> +
> +static void qcom_ec_probe_transport_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +
> +	ctx->functionality = I2C_FUNC_I2C;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EOPNOTSUPP);
> +	ctx->functionality = I2C_FUNC_SMBUS_READ_BYTE_DATA;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EOPNOTSUPP);
> +	KUNIT_EXPECT_EQ(test, ctx->transactions, 0);
> +}
> +
> +static void qcom_ec_probe_sensor_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), 0);
> +	KUNIT_EXPECT_EQ(test, ctx->transactions, 1);
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +	ctx->reply[0] = 0;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EPROTO);
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +}
> +
> +static void qcom_ec_reference_validation_test(struct kunit *test)
> +{
> +	struct qcom_ec_test_context *ctx = test->priv;
> +	u8 response[3];
> +
> +	ctx->block_length = 3;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, response), 0);
> +	ctx->block_length = 2;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, response), -EIO);
> +	ctx->block_length = 0;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, response),
> +			-EOPNOTSUPP);
> +	ctx->block_length = 3;
> +	ctx->reply[0] = 0;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, response), -EINVAL);
> +	ctx->reply[0] = 1;
> +	KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, response), -EINVAL);
> +	KUNIT_EXPECT_EQ(test, ctx->writes, 0);
> +}
> +
> +static void qcom_ec_variant_test(struct kunit *test)
> +{
> +	static const char compatible[] = "lenovo,yoga-slim7x-ec\0qcom,hamoa-crd-ec";
> +	struct property property = {
> +		.name = "compatible",
> +		.length = sizeof(compatible),
> +		.value = (void *)compatible,
> +	};
> +	struct device_node node = { .properties = &property };
> +	const struct of_device_id *match;
> +
> +	match = of_match_node(qcom_ec_of_match, &node);
> +	KUNIT_ASSERT_NOT_NULL(test, match);
> +	KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_slim7x);
> +	property.value = "qcom,hamoa-crd-ec";
> +	property.length = sizeof("qcom,hamoa-crd-ec");
> +	match = of_match_node(qcom_ec_of_match, &node);
> +	KUNIT_ASSERT_NOT_NULL(test, match);
> +	KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_reference);
> +}
> +
> +static struct kunit_case qcom_ec_test_cases[] = {
> +	KUNIT_CASE(qcom_ec_rpm_test),
> +	KUNIT_CASE(qcom_ec_temperature_test),
> +	KUNIT_CASE(qcom_ec_read_only_test),
> +	KUNIT_CASE(qcom_ec_probe_transport_test),
> +	KUNIT_CASE(qcom_ec_probe_sensor_test),
> +	KUNIT_CASE(qcom_ec_reference_validation_test),
> +	KUNIT_CASE(qcom_ec_variant_test),
> +	{}
> +};
> +
> +static struct kunit_suite qcom_ec_test_suite = {
> +	.name = "qcom-hamoa-ec",
> +	.init = qcom_ec_test_init,
> +	.test_cases = qcom_ec_test_cases,
> +};
> +
> +kunit_test_suite(qcom_ec_test_suite);
> diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm64/qcom-hamoa-ec.c
> index 3a4ca8a0d..043f6ab7e 100644
> --- a/drivers/platform/arm64/qcom-hamoa-ec.c
> +++ b/drivers/platform/arm64/qcom-hamoa-ec.c
> @@ -596,3 +596,7 @@ module_i2c_driver(qcom_ec_i2c_driver);
>  
>  MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
>  MODULE_LICENSE("GPL");
> +
> +#if IS_ENABLED(CONFIG_EC_QCOM_HAMOA_KUNIT_TEST)
> +#include "qcom-hamoa-ec-test.c"
> +#endif
> 
