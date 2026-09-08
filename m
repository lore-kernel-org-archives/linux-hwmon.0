Received: from mail-106121.protonmail.ch (mail-106121.protonmail.ch [79.135.106.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1A05329E7E;
	Tue,  8 Sep 2026 01:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.121
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788832639; cv=none; b=VodDEzJHROMnoAvd53yAm2puJc9f2HyLUSRibyvbavTu7cHd5BdjWkcukVnRA1FhcYl27BfCK1e3B7lXrM8677gPL71ZU+//GhbuZvk1VKW5z4tdqCJfjmmr0NmRPyY+P+poaEngSn50rjzb/QYFLGlgVifdyj7ciEw8N5IEd+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788832639; c=relaxed/simple;
	bh=I90uLmxBcumxygR08+v6n0cjwhkEbdY+f+9Tedk0hHA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I6G3VS5lPC4VEzEEnijEAU/tuK6vj1SGfvJBqU7mNZwayk+ufPE4JmhSjJiaWkRjaNJRa3hGkJ7Rljexkas2N+M10jdzn522PFksWq0HcpL9H6eeW1i9cLCP9pd8l5Tf9t9hvDzbtybTccJmVvWJr2GBdCUzrQyzNAJyEG93aB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=X7LZJuJz; arc=none smtp.client-ip=79.135.106.121
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="X7LZJuJz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1788832634; x=1789091834;
	bh=DfNVEzVrMl35YHsNx82vR8LdSSqAsyGmW5TEJdGFRC0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=X7LZJuJzkVN3i6OnXsBYZcaci+pbfbufCChAyWj2/oleMqh0PW3+FvQtDHWnBKsjh
	 HzEZHnBwUEvYY57Bu/+XlB1+/439zRP0moAr2GIE9Zy4pg4EXlMdeAWKTC/HPJmTuq
	 1p++jAduqeHFJrsOE9yWE4dBwlOA4Rawj0nheM+ew2MtxwWtq8FAloUqxrWmt6rcHd
	 qZXtOK89ycWIfBl0yLfDwOZ79iV2kk2GQN42ClPLrnKrBpCvefoPMFRO0Lbl0gzxuQ
	 jmsVZ/ylSKWHHgkmlLHxbU1aJmbRh2R0bdXwiwXj9dBNhX7bOe0o6PObhDTch9BR9B
	 8J6jb4quRQSTQ==
Date: Tue, 08 Sep 2026 01:57:11 +0000
To: Anvesh Jain P <anvesh.p@oss.qualcomm.com>, Sibi Sankar <sibi.sankar@oss.qualcomm.com>, Hans de Goede <hansg@kernel.org>, =?utf-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
From: Birk Skyum <birk.skyum@pm.me>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>, Guenter Roeck <linux@roeck-us.net>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Daniel J Blueman <daniel@quora.org>, Maya Matuszczyk <maccraft123mc@gmail.com>, linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] platform: arm64: qcom-hamoa-ec: test sensor and variant handling
Message-ID: <20260908015650.84401-3-birk.skyum@pm.me>
In-Reply-To: <20260908015650.84401-1-birk.skyum@pm.me>
References: <20260908015650.84401-1-birk.skyum@pm.me>
Feedback-ID: 21326998:user:proton
X-Pm-Message-ID: 8090e75d779578d1058d8d9ab132b75e3c05e7e6
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Exercise the sensor callbacks against a simulated I2C adapter. Check
little-endian RPM decoding, short transfers, malformed byte counts,
the unavailable-temperature sentinel and propagation of bus errors.

Check that the Lenovo compatible takes precedence over its reference-
board fallback, that its sensor attributes are read-only, and that its
probe and PM/remove callbacks do not issue control writes. Keep coverage
of the strict reference-board capability-response validation.

The tests use KUnit and never access a physical EC.

Signed-off-by: Birk Skyum <birk.skyum@pm.me>
---
 MAINTAINERS                                 |   1 +
 drivers/platform/arm64/Kconfig              |  12 +
 drivers/platform/arm64/qcom-hamoa-ec-test.c | 294 ++++++++++++++++++++
 drivers/platform/arm64/qcom-hamoa-ec.c      |   4 +
 4 files changed, 311 insertions(+)
 create mode 100644 drivers/platform/arm64/qcom-hamoa-ec-test.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 8518a97b4..58010a3e4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22442,6 +22442,7 @@ L:=09linux-arm-msm@vger.kernel.org
 S:=09Maintained
 F:=09Documentation/devicetree/bindings/embedded-controller/qcom,hamoa-crd-=
ec.yaml
 F:=09Documentation/hwmon/qcom-ec.rst
+F:=09drivers/platform/arm64/qcom-hamoa-ec-test.c
 F:=09drivers/platform/arm64/qcom-hamoa-ec.c
=20
 QUALCOMM HEXAGON ARCHITECTURE
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfi=
g
index 4f338c715..d940973be 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -105,4 +105,16 @@ config EC_QCOM_HAMOA
 =09  This driver supports Hamoa/Purwa/Glymur reference devices and read-on=
ly
 =09  fan speed and temperature monitoring on the Lenovo Yoga Slim 7x.
=20
+config EC_QCOM_HAMOA_KUNIT_TEST
+=09bool "Tests for the Qualcomm EC driver" if !KUNIT_ALL_TESTS
+=09depends on EC_QCOM_HAMOA && KUNIT && OF
+=09depends on EC_QCOM_HAMOA=3Dm || KUNIT=3Dy
+=09default KUNIT_ALL_TESTS
+=09help
+=09  Test the Qualcomm EC driver's sensor transactions and read-only
+=09  callbacks using a simulated I2C adapter. No physical EC is accessed.
+=09  Run these tests in a disposable test kernel, for example under QEMU.
+
+=09  If unsure, say N.
+
 endif # ARM64_PLATFORM_DEVICES
diff --git a/drivers/platform/arm64/qcom-hamoa-ec-test.c b/drivers/platform=
/arm64/qcom-hamoa-ec-test.c
new file mode 100644
index 000000000..68868ef76
--- /dev/null
+++ b/drivers/platform/arm64/qcom-hamoa-ec-test.c
@@ -0,0 +1,294 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Included by qcom-hamoa-ec.c to test its private transport and callbacks=
. */
+
+#include <kunit/resource.h>
+#include <kunit/test.h>
+#include <linux/of.h>
+
+struct qcom_ec_test_context {
+=09struct i2c_adapter adapter;
+=09struct qcom_ec ec;
+=09u32 functionality;
+=09int transfer_result;
+=09int byte_result;
+=09u8 reply[4];
+=09u8 block_length;
+=09unsigned int transactions;
+=09unsigned int writes;
+};
+
+static int qcom_ec_test_transfer(struct i2c_adapter *adapter,
+=09=09=09=09 struct i2c_msg *messages, int count)
+{
+=09struct qcom_ec_test_context *ctx =3D i2c_get_adapdata(adapter);
+
+=09ctx->transactions++;
+=09/* Only the RPM query's combined write/read transaction is allowed. */
+=09if (count !=3D 2 || messages[0].addr !=3D 0x76 || messages[1].addr !=3D=
 0x76 ||
+=09    messages[0].flags || messages[1].flags !=3D I2C_M_RD ||
+=09    messages[0].len !=3D 2 || messages[1].len !=3D 3 ||
+=09    messages[0].buf[0] !=3D 0x22 || messages[0].buf[1] !=3D 1) {
+=09=09ctx->writes++;
+=09=09return -EPROTO;
+=09}
+
+=09if (ctx->transfer_result =3D=3D 2)
+=09=09memcpy(messages[1].buf, ctx->reply, messages[1].len);
+
+=09return ctx->transfer_result;
+}
+
+static s32 qcom_ec_test_smbus(struct i2c_adapter *adapter, u16 address,
+=09=09=09      unsigned short flags, char read_write, u8 command,
+=09=09=09      int size, union i2c_smbus_data *data)
+{
+=09struct qcom_ec_test_context *ctx =3D i2c_get_adapdata(adapter);
+
+=09ctx->transactions++;
+=09if (read_write !=3D I2C_SMBUS_READ) {
+=09=09ctx->writes++;
+=09=09return -EPROTO;
+=09}
+=09if (address !=3D 0x76 || flags)
+=09=09return -EPROTO;
+
+=09if (command =3D=3D 0x29 && size =3D=3D I2C_SMBUS_BYTE_DATA) {
+=09=09if (ctx->byte_result < 0)
+=09=09=09return ctx->byte_result;
+=09=09data->byte =3D ctx->byte_result;
+=09=09return 0;
+=09}
+
+=09if ((command =3D=3D 0x0e || command =3D=3D 0x42) && size =3D=3D I2C_SMB=
US_I2C_BLOCK_DATA) {
+=09=09data->block[0] =3D ctx->block_length;
+=09=09memcpy(&data->block[1], ctx->reply, ctx->block_length);
+=09=09return 0;
+=09}
+
+=09return -EPROTO;
+}
+
+static u32 qcom_ec_test_functionality(struct i2c_adapter *adapter)
+{
+=09struct qcom_ec_test_context *ctx =3D i2c_get_adapdata(adapter);
+
+=09return ctx->functionality;
+}
+
+static const struct i2c_algorithm qcom_ec_test_algorithm =3D {
+=09.master_xfer =3D qcom_ec_test_transfer,
+=09.smbus_xfer =3D qcom_ec_test_smbus,
+=09.functionality =3D qcom_ec_test_functionality,
+};
+
+static void qcom_ec_test_delete_adapter(void *data)
+{
+=09i2c_del_adapter(data);
+}
+
+static void qcom_ec_test_unregister_client(void *data)
+{
+=09i2c_unregister_device(data);
+}
+
+static int qcom_ec_test_init(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx;
+=09int ret;
+
+=09ctx =3D kunit_kzalloc(test, sizeof(*ctx), GFP_KERNEL);
+=09KUNIT_ASSERT_NOT_NULL(test, ctx);
+=09test->priv =3D ctx;
+=09ctx->functionality =3D I2C_FUNC_I2C | I2C_FUNC_SMBUS_READ_BYTE_DATA |
+=09=09=09     I2C_FUNC_SMBUS_READ_I2C_BLOCK;
+=09ctx->transfer_result =3D 2;
+=09ctx->reply[0] =3D 2;
+=09ctx->byte_result =3D 36;
+=09ctx->adapter.owner =3D THIS_MODULE;
+=09ctx->adapter.algo =3D &qcom_ec_test_algorithm;
+=09strscpy(ctx->adapter.name, "qcom-ec-kunit", sizeof(ctx->adapter.name));
+=09i2c_set_adapdata(&ctx->adapter, ctx);
+=09ret =3D i2c_add_adapter(&ctx->adapter);
+=09KUNIT_ASSERT_EQ(test, ret, 0);
+=09ret =3D kunit_add_action_or_reset(test, qcom_ec_test_delete_adapter, &c=
tx->adapter);
+=09KUNIT_ASSERT_EQ(test, ret, 0);
+
+=09ctx->ec.client =3D i2c_new_dummy_device(&ctx->adapter, 0x76);
+=09KUNIT_ASSERT_NOT_ERR_OR_NULL(test, ctx->ec.client);
+=09ret =3D kunit_add_action_or_reset(test, qcom_ec_test_unregister_client,=
 ctx->ec.client);
+=09KUNIT_ASSERT_EQ(test, ret, 0);
+=09ctx->ec.variant =3D &qcom_ec_slim7x;
+=09i2c_set_clientdata(ctx->ec.client, &ctx->ec);
+
+=09return 0;
+}
+
+static void qcom_ec_rpm_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+=09static const struct {
+=09=09int transfer_result;
+=09=09u8 count;
+=09=09int error;
+=09} failures[] =3D {
+=09=09{ 0, 2, -EIO },
+=09=09{ 1, 2, -EIO },
+=09=09{ -EREMOTEIO, 2, -EREMOTEIO },
+=09=09{ -ETIMEDOUT, 2, -ETIMEDOUT },
+=09=09{ 2, 0, -EPROTO },
+=09=09{ 2, 1, -EPROTO },
+=09=09{ 2, 3, -EPROTO },
+=09=09{ 2, 0xff, -EPROTO },
+=09};
+=09long value =3D -1;
+=09int i;
+
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read_fan_rpm(&ctx->ec, &value), 0);
+=09KUNIT_EXPECT_EQ(test, value, 0);
+=09ctx->reply[1] =3D 0xef;
+=09ctx->reply[2] =3D 0xbe;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read_fan_rpm(&ctx->ec, &value), 0);
+=09KUNIT_EXPECT_EQ(test, value, 0xbeef);
+
+=09for (i =3D 0; i < ARRAY_SIZE(failures); i++) {
+=09=09value =3D -1;
+=09=09ctx->transfer_result =3D failures[i].transfer_result;
+=09=09ctx->reply[0] =3D failures[i].count;
+=09=09KUNIT_EXPECT_EQ_MSG(test, qcom_ec_read_fan_rpm(&ctx->ec, &value),
+=09=09=09=09    failures[i].error, "case %d", i);
+=09=09KUNIT_EXPECT_EQ(test, value, -1);
+=09}
+=09KUNIT_EXPECT_EQ(test, ctx->writes, 0);
+}
+
+static void qcom_ec_temperature_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+=09static const int temperatures[] =3D { 0, 36, 254, 255, -EREMOTEIO };
+=09long value;
+=09int i, ret;
+
+=09for (i =3D 0; i < ARRAY_SIZE(temperatures); i++) {
+=09=09value =3D -1;
+=09=09ctx->byte_result =3D temperatures[i];
+=09=09ret =3D qcom_ec_hwmon_read(&ctx->ec.client->dev, hwmon_temp,
+=09=09=09=09=09 hwmon_temp_input, 0, &value);
+=09=09if (temperatures[i] < 0) {
+=09=09=09KUNIT_EXPECT_EQ(test, ret, temperatures[i]);
+=09=09=09KUNIT_EXPECT_EQ(test, value, -1);
+=09=09} else if (temperatures[i] =3D=3D 255) {
+=09=09=09KUNIT_EXPECT_EQ(test, ret, -ENODATA);
+=09=09=09KUNIT_EXPECT_EQ(test, value, -1);
+=09=09} else {
+=09=09=09KUNIT_EXPECT_EQ(test, ret, 0);
+=09=09=09KUNIT_EXPECT_EQ(test, value, temperatures[i] * 1000);
+=09=09}
+=09}
+=09KUNIT_EXPECT_EQ(test, ctx->writes, 0);
+}
+
+static void qcom_ec_read_only_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+=09struct device *dev =3D &ctx->ec.client->dev;
+=09long value =3D -1;
+
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_fan, hwmon_f=
an_input, 0),
+=09=09=090444);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_temp, hwmon_=
temp_input, 0),
+=09=09=090444);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_fan, hwmon_f=
an_input, 1), 0);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_is_visible(NULL, hwmon_pwm, hwmon_p=
wm_input, 0), 0);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_read(dev, hwmon_fan, hwmon_fan_inpu=
t, 1, &value),
+=09=09=09-EOPNOTSUPP);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_read(dev, hwmon_pwm, hwmon_pwm_inpu=
t, 0, &value),
+=09=09=09-EOPNOTSUPP);
+=09KUNIT_EXPECT_EQ(test, value, -1);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_suspend(dev), 0);
+=09KUNIT_EXPECT_EQ(test, qcom_ec_resume(dev), 0);
+=09qcom_ec_remove(ctx->ec.client);
+=09KUNIT_EXPECT_EQ(test, ctx->transactions, 0);
+}
+
+static void qcom_ec_probe_transport_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+
+=09ctx->functionality =3D I2C_FUNC_I2C;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EOPNOTSUPP);
+=09ctx->functionality =3D I2C_FUNC_SMBUS_READ_BYTE_DATA;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EOPNOTSUPP);
+=09KUNIT_EXPECT_EQ(test, ctx->transactions, 0);
+}
+
+static void qcom_ec_probe_sensor_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), 0);
+=09KUNIT_EXPECT_EQ(test, ctx->transactions, 1);
+=09KUNIT_EXPECT_EQ(test, ctx->writes, 0);
+=09ctx->reply[0] =3D 0;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_hwmon_probe(&ctx->ec), -EPROTO);
+=09KUNIT_EXPECT_EQ(test, ctx->writes, 0);
+}
+
+static void qcom_ec_reference_validation_test(struct kunit *test)
+{
+=09struct qcom_ec_test_context *ctx =3D test->priv;
+=09u8 response[3];
+
+=09ctx->block_length =3D 3;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, res=
ponse), 0);
+=09ctx->block_length =3D 2;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, res=
ponse), -EIO);
+=09ctx->block_length =3D 0;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, res=
ponse),
+=09=09=09-EOPNOTSUPP);
+=09ctx->block_length =3D 3;
+=09ctx->reply[0] =3D 0;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, res=
ponse), -EINVAL);
+=09ctx->reply[0] =3D 1;
+=09KUNIT_EXPECT_EQ(test, qcom_ec_read(&ctx->ec, EC_THERMAL_CAP_CMD, 3, res=
ponse), -EINVAL);
+=09KUNIT_EXPECT_EQ(test, ctx->writes, 0);
+}
+
+static void qcom_ec_variant_test(struct kunit *test)
+{
+=09static const char compatible[] =3D "lenovo,yoga-slim7x-ec\0qcom,hamoa-c=
rd-ec";
+=09struct property property =3D {
+=09=09.name =3D "compatible",
+=09=09.length =3D sizeof(compatible),
+=09=09.value =3D (void *)compatible,
+=09};
+=09struct device_node node =3D { .properties =3D &property };
+=09const struct of_device_id *match;
+
+=09match =3D of_match_node(qcom_ec_of_match, &node);
+=09KUNIT_ASSERT_NOT_NULL(test, match);
+=09KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_slim7x);
+=09property.value =3D "qcom,hamoa-crd-ec";
+=09property.length =3D sizeof("qcom,hamoa-crd-ec");
+=09match =3D of_match_node(qcom_ec_of_match, &node);
+=09KUNIT_ASSERT_NOT_NULL(test, match);
+=09KUNIT_EXPECT_PTR_EQ(test, match->data, &qcom_ec_reference);
+}
+
+static struct kunit_case qcom_ec_test_cases[] =3D {
+=09KUNIT_CASE(qcom_ec_rpm_test),
+=09KUNIT_CASE(qcom_ec_temperature_test),
+=09KUNIT_CASE(qcom_ec_read_only_test),
+=09KUNIT_CASE(qcom_ec_probe_transport_test),
+=09KUNIT_CASE(qcom_ec_probe_sensor_test),
+=09KUNIT_CASE(qcom_ec_reference_validation_test),
+=09KUNIT_CASE(qcom_ec_variant_test),
+=09{}
+};
+
+static struct kunit_suite qcom_ec_test_suite =3D {
+=09.name =3D "qcom-hamoa-ec",
+=09.init =3D qcom_ec_test_init,
+=09.test_cases =3D qcom_ec_test_cases,
+};
+
+kunit_test_suite(qcom_ec_test_suite);
diff --git a/drivers/platform/arm64/qcom-hamoa-ec.c b/drivers/platform/arm6=
4/qcom-hamoa-ec.c
index 3a4ca8a0d..043f6ab7e 100644
--- a/drivers/platform/arm64/qcom-hamoa-ec.c
+++ b/drivers/platform/arm64/qcom-hamoa-ec.c
@@ -596,3 +596,7 @@ module_i2c_driver(qcom_ec_i2c_driver);
=20
 MODULE_DESCRIPTION("QCOM Hamoa Embedded Controller");
 MODULE_LICENSE("GPL");
+
+#if IS_ENABLED(CONFIG_EC_QCOM_HAMOA_KUNIT_TEST)
+#include "qcom-hamoa-ec-test.c"
+#endif
--=20
2.53.0


