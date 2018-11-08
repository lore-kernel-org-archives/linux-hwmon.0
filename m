Return-Path: <chrisp@alliedtelesis.co.nz>
Return-path: <chrisp@alliedtelesis.co.nz>
From: Chris Packham <chris.packham@alliedtelesis.co.nz>
To: linux@roeck-us.net,
	robh+dt@kernel.org,
	jdelvare@suse.com
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: [PATCH v2 2/2] hwmon: (adt7475): add support for inverting the pwm output
Date: Fri,  9 Nov 2018 11:56:07 +1300
Message-Id: <20181108225607.7521-3-chris.packham@alliedtelesis.co.nz>
In-Reply-To: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
References: <20181108225607.7521-1-chris.packham@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-ID: <linux-hwmon@vger.kernel.org>

Add a "invert-pwm" device-tree property to allow hardware designs to use
inverted logic on the PWM output. We intentionally preserve the invert
PWM output bit if the property is not found to allow for
bootloaders/bios which may have configured this earlier.

Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
---
Changes in v2:
- use "pwm-polarity" and support setting both logic high and logic low

=20drivers/hwmon/adt7475.c | 28 ++++++++++++++++++++++++++++
=201 file changed, 28 insertions(+)

diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
index f4c7516eb989..ce2c7d6493c0 100644
--- a/drivers/hwmon/adt7475.c
+++ b/drivers/hwmon/adt7475.c
@@ -23,6 +23,7 @@
=20#include <linux/err.h>
=20#include <linux/jiffies.h>
=20#include <linux/util_macros.h>
+#include <linux/pwm.h>
=20
=20/* Indexes for the sysfs hooks */
=20
@@ -1536,6 +1537,23 @@ static int adt7475_update_limits(struct i2c_client=
=20*client)
=20	return 0;
=20}
=20
+static int adt7475_set_pwm_polarity(struct i2c_client *client, int index=
,
+				    enum pwm_polarity pol)
+{
+	int ret;
+
+	ret =3D adt7475_read(PWM_CONFIG_REG(index));
+	if (ret < 0)
+		return ret;
+
+	if (pol =3D=3D PWM_POLARITY_INVERSED)
+		ret |=3D BIT(4);
+	else
+		ret &=3D ~BIT(4);
+
+	return i2c_smbus_write_byte_data(client, PWM_CONFIG_REG(index), ret);
+}
+
=20static int adt7475_probe(struct i2c_client *client,
=20			 const struct i2c_device_id *id)
=20{
@@ -1638,6 +1656,16 @@ static int adt7475_probe(struct i2c_client *client=
,
=20	for (i =3D 0; i < ADT7475_PWM_COUNT; i++)
=20		adt7475_read_pwm(client, i);
=20
+	if (client->dev.of_node) {
+		enum pwm_polarity polarity;
+
+		ret =3D of_property_read_u32(client->dev.of_node, "pwm-polarity",
+					   &polarity);
+		if (!ret)
+			for (i =3D 0; i < ADT7475_PWM_COUNT; i++)
+				adt7475_set_pwm_polarity(client, i, polarity);
+	}
+
=20	/* Start monitoring */
=20	switch (chip) {
=20	case adt7475:
--=20
2.19.1
