Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5B54F30C1;
	Thu, 15 Oct 2026 14:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792074259; cv=none; b=VNWbQEpZ8cE18r525cCV4hiKQzGpWuuI2foTHwU7iZFhO7Nc2zdHPtHrSf+xt7A5aia0/pHYFXnCAK+gIyr7Hg3NpvKLwdp7wPf8CipzaxTDcHlEETC0f2CEXHNzd7JYA6ofYBo6CsD3zDmRo4wc5o7wT50EaMOwJTmcHMWvHUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792074259; c=relaxed/simple;
	bh=C6rBhk56ZCu037XTWGtPBXa84rIcwqJ1P7kBHMYjkEU=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=WoNksFsi5exQ6B0vH93umJrLhuwHN3BK8/EG1kWhmUx+wtXJbNhE5KAEUMDc+cIBKdLKXXevock6XQIo7fkBFGWdiThGU534SUqgW73D1P5vfZRjJ8BEntptwQI58UDFOCokIwJaGRcnMynUjXJNfjgsuacmYUJzQ2yCsErcoLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FcbgXPg8; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FcbgXPg8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792074258; x=1823610258;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=C6rBhk56ZCu037XTWGtPBXa84rIcwqJ1P7kBHMYjkEU=;
  b=FcbgXPg8+lEtYeX7Z6xDmprS6WzjcbCjM9FOQmuiAh9zKhoEc9smobGp
   FvKYR+WDdXI2byfHmd0EhCaZ/ny9P2r17yv/v52kyVsg77vks0Y0eVuoY
   KmdsDoPZENMHmSc55IVplQYz5ov8E1lprRhaNlXZG6EQDv8ZV9Fu29SJM
   zBVQnjNt+/vDYZ3et1exr/blVdG6cmwFl5npxXPAkTwMOzqBjGiFln3Z7
   /SG3LdpNwhZEbnQX2auS2g1EOIuMyFe+QaHtfaan+r01VWzGAbhLmaYr1
   HNhdtagXievqz+TUhIffUsTJTVTZmqqVhEIWuB9BfJPlspy6lIj19VOU0
   g==;
X-CSE-ConnectionGUID: 0vfwFg2MTci20XDszqmLcg==
X-CSE-MsgGUID: 6lnMhKc3QrGI/HEi+wcDBg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="726490"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="726490"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:24:17 -0700
X-CSE-ConnectionGUID: FtJ5O1WvT1uzW4J+NkCcvg==
X-CSE-MsgGUID: zz3ywiFVQweCXtP/sIS7fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1679024"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.130])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2026 07:24:11 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Thu, 15 Oct 2026 17:24:08 +0300 (EEST)
To: Konrad Dybcio <konradybcio@kernel.org>
cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
    Conor Dooley <conor+dt@kernel.org>, Hans de Goede <hansg@kernel.org>, 
    Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
    Guenter Roeck <linux@roeck-us.net>, Bjorn Andersson <andersson@kernel.org>, 
    Abel Vesa <abelvesa@kernel.org>, devicetree@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
    Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] platform: arm64: Add a driver for the EC found
 on ASUS Glymur machines
In-Reply-To: <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
Message-ID: <ba7830c7-9ad8-6695-f543-c4c419aa9133@linux.intel.com>
References: <20261015-topic-asus_ec-v4-0-af6305ffcb10@oss.qualcomm.com> <20261015-topic-asus_ec-v4-2-af6305ffcb10@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-495338107-1792074248=:1307"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-495338107-1792074248=:1307
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Thu, 15 Oct 2026, Konrad Dybcio wrote:

> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>=20
> Some Qualcomm Snapdragon X2 Elite (Extreme)-based ASUS laptops (at
> least the Zenbook A14 and A16) expose a custom, somewhat
> Qualcomm reference-derived EC interface. Introduce a driver to
> communicate with said EC, allowing for fan speed reporting, keyboard
> backlight setting and receiving of a number of miscellaneous sideband
> events.
>=20
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/platform/arm64/Kconfig          |  16 +
>  drivers/platform/arm64/Makefile         |   1 +
>  drivers/platform/arm64/asus-glymur-ec.c | 616 ++++++++++++++++++++++++++=
++++++
>  3 files changed, 633 insertions(+)
>=20
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kcon=
fig
> index e32e01b2a9bd..84c475c62990 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -33,6 +33,22 @@ config EC_ACER_ASPIRE1
>  =09  laptop where this information is not properly exposed via the
>  =09  standard ACPI devices.
> =20
> +config EC_ASUS_GLYMUR
> +=09tristate "ASUS Zenbook A16 (Qualcomm) Embedded Controller driver"
> +=09depends on ARCH_QCOM || COMPILE_TEST
> +=09depends on I2C
> +=09depends on HWMON
> +=09depends on INPUT
> +=09depends on PM
> +=09depends on THERMAL || THERMAL=3Dn
> +=09select NEW_LEDS
> +=09select LEDS_CLASS
> +=09help
> +=09  Say M or Y here to enable the EC driver for the Qualcomm Snapdragon=
-
> +=09  based ASUS Zenbook A16 (UX3607OA) and similar machines. It provides
> +=09  temperature sensors readout, fan monitoring, keyboard and EC event
> +=09  reporting.
> +
>  config EC_HUAWEI_GAOKUN
>  =09tristate "Huawei Matebook E Go Embedded Controller driver"
>  =09depends on ARCH_QCOM || COMPILE_TEST
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Mak=
efile
> index 7681be4a46e9..7122e8ea325f 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -6,6 +6,7 @@
>  #
> =20
>  obj-$(CONFIG_EC_ACER_ASPIRE1)=09+=3D acer-aspire1-ec.o
> +obj-$(CONFIG_EC_ASUS_GLYMUR) +=3D asus-glymur-ec.o
>  obj-$(CONFIG_EC_HUAWEI_GAOKUN)=09+=3D huawei-gaokun-ec.o
>  obj-$(CONFIG_EC_LENOVO_YOGA_C630) +=3D lenovo-yoga-c630.o
>  obj-$(CONFIG_EC_LENOVO_THINKPAD_T14S) +=3D lenovo-thinkpad-t14s.o
> diff --git a/drivers/platform/arm64/asus-glymur-ec.c b/drivers/platform/a=
rm64/asus-glymur-ec.c
> new file mode 100644
> index 000000000000..532610592d1f
> --- /dev/null
> +++ b/drivers/platform/arm64/asus-glymur-ec.c
> @@ -0,0 +1,616 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * The EC firmware on the ASUS Zenbook A16 looks to be derived from the
> + * 'Qualcomm Hamoa EC' reference base with many major modifications. Som=
e of
> + * the original interface is reused, albeit many of its core invariants =
(such
> + * as the capabilities bitmap) are absent.
> + *
> + * It presents itself as two I2C devices:
> + *  [0x5b] is the custom ASUS interface
> + *  [0x76] is the Hamoa EC-derived interface
> + */
> +
> +#include <asm/byteorder.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/hwmon.h>
> +#include <linux/i2c.h>
> +#include <linux/interrupt.h>
> +#include <linux/kernel.h>
> +#include <linux/leds.h>
> +#include <linux/lockdep.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +/* Qualcomm-derived registers (main device @ 0x76) */
> +#define ASUS_QCOM_EC_EVENT_CMD=09=090x05
> + #define ASUS_QCOM_EC_EVENT_NONE=090x00
> + #define ASUS_QCOM_EC_EVENT_INVALID=090xff
> +
> +#define ASUS_QCOM_EC_SUBCMD_FULL_VER=090x0f
> +#define ASUS_QCOM_EC_FULL_VER_LEN=097
> +
> +/* This "read RAM" command isn't actually part of the Qualcomm standard =
*/
> +#define ASUS_QCOM_EC_RECM_OFFS=09=090x52
> +
> +#define ASUS_QCOM_EC_RAM_FAN_CPU=090x0602
> +#define ASUS_QCOM_EC_RAM_AC_STATUS=090x0609
> +#define ASUS_QCOM_EC_RAM_FAN_GPU=090x0624
> +
> +#define ASUS_QCOM_EC_MODERN_STANDBY_CMD=09=090x23
> +#define ASUS_QCOM_EC_MODERN_STANDBY_ENTER=090x07
> +#define ASUS_QCOM_EC_MODERN_STANDBY_EXIT=090x08
> +
> +/* ASUS-specific registers (secondary device @ 0x5b) */
> +#define ASUS_EC_SUBDEV_ADDR=09=090x5b
> +
> +#define ASUS_EC_REQ_REG=09=09=090x10
> +#define ASUS_EC_RESP_REG=09=090x11
> +
> +#define ASUS_EC_PAGE_MAILBOX=09=090xc4
> + #define ASUS_EC_MBOX_REG_CMD=09=090x30
> + #define ASUS_EC_MBOX_REG_SUBCMD=090x31
> + #define ASUS_EC_MBOX_REG_DATA=09=090x32
> +
> +#define ASUS_EC_MBOX_CMD_KBD=09=090x01
> + #define ASUS_EC_MBOX_SUBCMD_KBD_EN=090x81
> +  #define ASUS_EC_MBOX_DATA_KBD_EN=090x04
> + #define ASUS_EC_MBOX_SUBCMD_KBD_LVL=090x87
> +
> +#define ASUS_EC_MBOX_CMD_MISC=09=090x02
> + #define ASUS_EC_MBOX_SUBCMD_MISC_ENABLE=090x83
> +
> +#define ASUS_EC_PAGE_TEMPERATURE=090xc6
> + #define ASUS_EC_TEMP_REG_CPU=09=090xa6
> + #define ASUS_EC_TEMP_REG_SOC=09=090x2a
> + #define ASUS_EC_TEMP_MAX=09=090x7f
> +
> +#define ASUS_EC_KBD_MAX_BRIGHTNESS=093
> +
> +static const u8 asus_ec_kbd_levels[] =3D {
> +=09[0] =3D 0x00,
> +=09[1] =3D 0x55,
> +=09[2] =3D 0xaa,
> +=09[3] =3D 0xff,
> +};
> +
> +enum asus_ec_event {
> +=09ASUS_EC_EVT_CHARGE_STATE =3D 0x1c,
> +=09ASUS_EC_EVT_AC_STATE =3D 0x1d,
> +=09ASUS_EC_EVT_CRIT_TRIP =3D 0x1e,
> +=09ASUS_EC_EVT_THERMISTOR =3D 0x4f,
> +=09ASUS_EC_EVT_HOTKEY =3D 0xda,
> +=09ASUS_EC_EVT_FAN_STATUS =3D 0xdb,
> +=09ASUS_EC_EVT_THERMAL_TRIP =3D 0xe0,
> +=09ASUS_EC_EVT_CHARGE_COMMIT =3D 0xe4,
> +};
> +
> +struct asus_ec {
> +=09struct i2c_client *client;
> +=09struct i2c_client *subdev_client;
> +=09/* Serializes all EC access across both I2C devices */
> +=09struct mutex lock;
> +=09struct device *hwmon_dev;
> +=09struct led_classdev kbd_led;
> +};
> +
> +/* RAM addresses are sent MSB first, while returned data is LSB first. *=
/
> +struct asus_qcom_ec_ram_request {
> +=09__be16 addr;
> +=09u8 count;
> +=09u8 reserved[2];
> +} __packed;
> +
> +struct asus_qcom_ec_ram_response {
> +=09__le16 data;
> +=09u8 unused[3];
> +} __packed;

Endianness stuff looks sane now but __packed also needs an include.

> +static int asus_qcom_ec_write(struct asus_ec *ec, u8 offset,
> +=09=09=09      const u8 *buf, u8 len)
> +{
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09ret =3D i2c_smbus_write_i2c_block_data(ec->client, offset, len, buf);
> +=09if (ret < 0) {
> +=09=09dev_dbg(&ec->client->dev,
> +=09=09=09"Main device write off %#x len %u failed: %d\n",
> +=09=09=09offset, len, ret);
> +=09}
> +
> +=09return ret;
> +}
> +
> +static int asus_qcom_ec_read(struct asus_ec *ec, u8 offset, u8 *buf, u8 =
len)
> +{
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09ret =3D i2c_smbus_read_i2c_block_data(ec->client, offset, len, buf);
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (ret < len) {
> +=09=09dev_err(&ec->client->dev,
> +=09=09=09"Short read off %#x: got %d of %u bytes\n",
> +=09=09=09offset, ret, len);
> +=09=09return -EIO;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int asus_qcom_ec_read_ram(struct asus_ec *ec, u16 addr, u8 count,=
 u16 *out)
> +{
> +=09struct asus_qcom_ec_ram_request req =3D {
> +=09=09.addr =3D cpu_to_be16(addr),
> +=09=09.count =3D count,
> +=09=09.reserved =3D { 0 },

0 is the default init value so generally =3D {} should be enough but I thin=
k=20
it's not necessary to add the reserved member at all because the entire=20
struct should be initialized anyway by the surrounding construct.

With these fixed,

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>

--
 i.

> +=09};
> +=09struct asus_qcom_ec_ram_response resp =3D { };
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09if (count !=3D 1 && count !=3D 2)
> +=09=09return -EINVAL;
> +
> +=09ret =3D asus_qcom_ec_write(ec, ASUS_QCOM_EC_RECM_OFFS,
> +=09=09=09=09 (const u8 *)&req, sizeof(req));
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D asus_qcom_ec_read(ec, ASUS_QCOM_EC_RECM_OFFS,
> +=09=09=09=09(u8 *)&resp, sizeof(resp));
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09if (count =3D=3D 2)
> +=09=09*out =3D le16_to_cpu(resp.data);
> +=09else
> +=09=09*out =3D (u8)le16_to_cpu(resp.data);
> +
> +=09return 0;
> +}
> +
> +static int asus_ec_readb(struct asus_ec *ec, u8 page, u8 reg, u8 *out)
> +{
> +=09u8 sel[2] =3D { page, reg };
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09ret =3D i2c_smbus_write_i2c_block_data(ec->subdev_client, ASUS_EC_REQ=
_REG,
> +=09=09=09=09=09     sizeof(sel), sel);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D i2c_smbus_read_byte_data(ec->subdev_client, ASUS_EC_RESP_REG)=
;
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09*out =3D ret;
> +
> +=09return 0;
> +}
> +
> +static int asus_ec_writeb(struct asus_ec *ec, u8 page, u8 reg, u8 data)
> +{
> +=09u8 sel[2] =3D { page, reg };
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09ret =3D i2c_smbus_write_i2c_block_data(ec->subdev_client, ASUS_EC_REQ=
_REG,
> +=09=09=09=09=09     sizeof(sel), sel);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return i2c_smbus_write_byte_data(ec->subdev_client,
> +=09=09=09=09=09 ASUS_EC_RESP_REG, data);
> +}
> +
> +static int asus_ec_wait_mailbox(struct asus_ec *ec)
> +{
> +=09int ret, tries;
> +=09u8 status;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09for (tries =3D 5; tries > 0; tries--) {
> +=09=09ret =3D asus_ec_readb(ec, ASUS_EC_PAGE_MAILBOX,
> +=09=09=09=09    ASUS_EC_MBOX_REG_CMD, &status);
> +=09=09if (ret < 0)
> +=09=09=09return ret;
> +=09=09if (!status)
> +=09=09=09return 0;
> +=09=09usleep_range(5000, 6000);
> +=09}
> +
> +=09return -ETIMEDOUT;
> +}
> +
> +static int asus_ec_mailbox_cmd(struct asus_ec *ec, u8 cmd, u8 sub, u8 da=
ta)
> +{
> +=09int ret;
> +
> +=09lockdep_assert_held(&ec->lock);
> +
> +=09ret =3D asus_ec_wait_mailbox(ec);
> +=09if (ret < 0)
> +=09=09return ret =3D=3D -ETIMEDOUT ? -EBUSY : ret;
> +
> +=09ret =3D asus_ec_writeb(ec, ASUS_EC_PAGE_MAILBOX, ASUS_EC_MBOX_REG_SUB=
CMD, sub);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D asus_ec_writeb(ec, ASUS_EC_PAGE_MAILBOX, ASUS_EC_MBOX_REG_DAT=
A, data);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09ret =3D asus_ec_writeb(ec, ASUS_EC_PAGE_MAILBOX, ASUS_EC_MBOX_REG_CMD=
, cmd);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return asus_ec_wait_mailbox(ec);
> +}
> +
> +static int asus_ec_enable_writes(struct asus_ec *ec)
> +{
> +=09guard(mutex)(&ec->lock);
> +
> +=09return asus_ec_mailbox_cmd(ec, ASUS_EC_MBOX_CMD_MISC,
> +=09=09=09=09   ASUS_EC_MBOX_SUBCMD_MISC_ENABLE, 1);
> +}
> +
> +static int asus_ec_read_version(struct asus_ec *ec, u8 *major, u8 *minor=
, u8 *patch)
> +{
> +=09u8 resp[ASUS_QCOM_EC_FULL_VER_LEN + 1];
> +=09int ret;
> +
> +=09guard(mutex)(&ec->lock);
> +
> +=09ret =3D asus_qcom_ec_read(ec, ASUS_QCOM_EC_SUBCMD_FULL_VER,
> +=09=09=09=09resp, sizeof(resp));
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (resp[0] < ASUS_QCOM_EC_FULL_VER_LEN)
> +=09=09return -EIO;
> +
> +=09*major =3D resp[3];
> +=09*minor =3D resp[2];
> +=09*patch =3D resp[1];
> +
> +=09return 0;
> +}
> +
> +static int asus_ec_get_temp(struct asus_ec *ec, u8 reg, long *millideg)
> +{
> +=09u8 raw;
> +=09int ret;
> +
> +=09guard(mutex)(&ec->lock);
> +
> +=09ret =3D asus_ec_readb(ec, ASUS_EC_PAGE_TEMPERATURE, reg, &raw);
> +=09if (ret < 0)
> +=09=09return ret;
> +=09if (raw > ASUS_EC_TEMP_MAX)
> +=09=09return -ENODATA;
> +
> +=09*millideg =3D raw * MILLIDEGREE_PER_DEGREE;
> +
> +=09return 0;
> +}
> +
> +static int asus_ec_get_fan_rpm(struct asus_ec *ec, u16 base, long *rpm)
> +{
> +=09u16 val;
> +=09int ret;
> +
> +=09guard(mutex)(&ec->lock);
> +
> +=09ret =3D asus_qcom_ec_read_ram(ec, base, 2, &val);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09*rpm =3D val;
> +
> +=09return 0;
> +}
> +
> +static irqreturn_t asus_ec_irq(int irq, void *data)
> +{
> +=09struct asus_ec *ec =3D data;
> +=09struct device *dev =3D &ec->client->dev;
> +=09int code;
> +
> +=09scoped_guard(mutex, &ec->lock)
> +=09=09code =3D i2c_smbus_read_byte_data(ec->client, ASUS_QCOM_EC_EVENT_C=
MD);
> +
> +=09if (code < 0) {
> +=09=09dev_err_ratelimited(dev, "Failed to read EC event: %d\n", code);
> +=09=09return IRQ_HANDLED;
> +=09}
> +=09if (code =3D=3D ASUS_QCOM_EC_EVENT_NONE ||
> +=09    code =3D=3D ASUS_QCOM_EC_EVENT_INVALID)
> +=09=09return IRQ_HANDLED;
> +
> +=09switch (code) {
> +=09case ASUS_EC_EVT_HOTKEY:
> +=09=09/* Present in DSDT, don't know what triggers it */
> +=09=09dev_dbg_ratelimited(dev, "EC hotkey event\n");
> +=09=09break;
> +
> +=09case ASUS_EC_EVT_FAN_STATUS:
> +=09=09dev_dbg_ratelimited(dev, "Fan status changed\n");
> +=09=09break;
> +
> +=09/* Maybe the temperature of the EC itself? */
> +=09case ASUS_EC_EVT_THERMAL_TRIP:
> +=09case ASUS_EC_EVT_CRIT_TRIP:
> +=09/* ASUS_EC_TEMP_SOC climbing above 91 *C or falling below 92 *C */
> +=09case ASUS_EC_EVT_THERMISTOR:
> +=09=09dev_dbg_ratelimited(dev, "Thermal event %#x\n", code);
> +=09=09break;
> +
> +=09case ASUS_EC_EVT_AC_STATE: {
> +=09=09u16 ac =3D 0;
> +=09=09int ret;
> +
> +=09=09/* TODO: ping SoCCP over the pmic_glink OEM-specific interface */
> +=09=09scoped_guard(mutex, &ec->lock)
> +=09=09=09ret =3D asus_qcom_ec_read_ram(ec, ASUS_QCOM_EC_RAM_AC_STATUS, 1=
, &ac);
> +=09=09if (ret < 0) {
> +=09=09=09dev_warn_ratelimited(dev,
> +=09=09=09=09=09     "Failed to read AC status: %d\n",
> +=09=09=09=09=09     ret);
> +=09=09=09break;
> +=09=09}
> +=09=09dev_dbg_ratelimited(dev, "AC event: 0x%x\n", ac);
> +=09=09break;
> +=09}
> +=09case ASUS_EC_EVT_CHARGE_STATE:
> +=09case ASUS_EC_EVT_CHARGE_COMMIT:
> +=09=09break;
> +
> +=09default:
> +=09=09dev_info_ratelimited(dev, "unknown EC event: %#x\n", code);
> +=09=09break;
> +=09}
> +
> +=09return IRQ_HANDLED;
> +}
> +
> +static int asus_ec_kbd_led_set(struct led_classdev *led,
> +=09=09=09       enum led_brightness brightness)
> +{
> +=09struct asus_ec *ec =3D container_of(led, struct asus_ec, kbd_led);
> +=09int ret;
> +
> +=09if (brightness > ASUS_EC_KBD_MAX_BRIGHTNESS)
> +=09=09brightness =3D ASUS_EC_KBD_MAX_BRIGHTNESS;
> +
> +=09guard(mutex)(&ec->lock);
> +
> +=09ret =3D asus_ec_mailbox_cmd(ec, ASUS_EC_MBOX_CMD_KBD, ASUS_EC_MBOX_SU=
BCMD_KBD_EN,
> +=09=09=09=09  ASUS_EC_MBOX_DATA_KBD_EN);
> +=09if (ret < 0)
> +=09=09return ret;
> +
> +=09return asus_ec_mailbox_cmd(ec, ASUS_EC_MBOX_CMD_KBD, ASUS_EC_MBOX_SUB=
CMD_KBD_LVL,
> +=09=09=09=09   asus_ec_kbd_levels[brightness]);
> +}
> +
> +enum asus_ec_temp_channel {
> +=09/* External sensor? */
> +=09ASUS_EC_TEMP_CPU,
> +=09/* Likely SoC-internal temp data communicated over a side channel */
> +=09ASUS_EC_TEMP_SOC,
> +=09ASUS_EC_TEMP_COUNT,
> +};
> +
> +static umode_t asus_ec_hwmon_is_visible(const void *data,
> +=09=09=09=09=09enum hwmon_sensor_types type,
> +=09=09=09=09=09u32 attr, int channel)
> +{
> +=09switch (type) {
> +=09case hwmon_fan:
> +=09case hwmon_temp:
> +=09=09return 0444;
> +=09default:
> +=09=09return 0;
> +=09}
> +}
> +
> +static int asus_ec_hwmon_read(struct device *dev,
> +=09=09=09      enum hwmon_sensor_types type,
> +=09=09=09      u32 attr, int channel, long *val)
> +{
> +=09struct asus_ec *ec =3D dev_get_drvdata(dev);
> +
> +=09switch (type) {
> +=09case hwmon_temp:
> +=09=09switch (channel) {
> +=09=09case ASUS_EC_TEMP_CPU:
> +=09=09=09return asus_ec_get_temp(ec, ASUS_EC_TEMP_REG_CPU, val);
> +=09=09case ASUS_EC_TEMP_SOC:
> +=09=09=09return asus_ec_get_temp(ec, ASUS_EC_TEMP_REG_SOC, val);
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09case hwmon_fan:
> +=09=09switch (channel) {
> +=09=09case 0:
> +=09=09=09return asus_ec_get_fan_rpm(ec, ASUS_QCOM_EC_RAM_FAN_CPU, val);
> +=09=09case 1:
> +=09=09=09return asus_ec_get_fan_rpm(ec, ASUS_QCOM_EC_RAM_FAN_GPU, val);
> +=09=09default:
> +=09=09=09return -EINVAL;
> +=09=09}
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +}
> +
> +static int asus_ec_hwmon_read_string(struct device *dev,
> +=09=09=09=09     enum hwmon_sensor_types type,
> +=09=09=09=09     u32 attr, int channel, const char **str)
> +{
> +=09if (type !=3D hwmon_temp || channel >=3D ASUS_EC_TEMP_COUNT)
> +=09=09return -EINVAL;
> +
> +=09switch (channel) {
> +=09case ASUS_EC_TEMP_CPU:
> +=09=09*str =3D "CPU";
> +=09=09break;
> +=09case ASUS_EC_TEMP_SOC:
> +=09=09*str =3D "SoC";
> +=09=09break;
> +=09}
> +
> +=09return 0;
> +}
> +
> +static const struct hwmon_channel_info * const asus_ec_hwmon_info[] =3D =
{
> +=09HWMON_CHANNEL_INFO(chip, HWMON_C_REGISTER_TZ),
> +=09HWMON_CHANNEL_INFO(temp,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL,
> +=09=09=09   HWMON_T_INPUT | HWMON_T_LABEL),
> +=09HWMON_CHANNEL_INFO(fan,
> +=09=09=09   HWMON_F_INPUT,
> +=09=09=09   HWMON_F_INPUT),
> +=09NULL
> +};
> +
> +static const struct hwmon_ops asus_ec_hwmon_ops =3D {
> +=09.is_visible=09=3D asus_ec_hwmon_is_visible,
> +=09.read=09=09=3D asus_ec_hwmon_read,
> +=09.read_string=09=3D asus_ec_hwmon_read_string,
> +};
> +
> +static const struct hwmon_chip_info asus_ec_hwmon_chip_info =3D {
> +=09.ops=09=3D &asus_ec_hwmon_ops,
> +=09.info=09=3D asus_ec_hwmon_info,
> +};
> +
> +static int asus_glymur_ec_probe(struct i2c_client *client)
> +{
> +=09struct device *dev =3D &client->dev;
> +=09u8 major, minor, patch;
> +=09struct asus_ec *ec;
> +=09int ret;
> +
> +=09ec =3D devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
> +=09if (!ec)
> +=09=09return -ENOMEM;
> +
> +=09ec->client =3D client;
> +=09i2c_set_clientdata(client, ec);
> +
> +=09ret =3D devm_mutex_init(dev, &ec->lock);
> +=09if (ret)
> +=09=09return ret;
> +
> +=09ec->subdev_client =3D devm_i2c_new_dummy_device(dev, client->adapter,
> +=09=09=09=09=09=09      ASUS_EC_SUBDEV_ADDR);
> +=09if (IS_ERR(ec->subdev_client)) {
> +=09=09return dev_err_probe(dev, PTR_ERR(ec->subdev_client),
> +=09=09=09=09     "Failed to register 0x5b EC device\n");
> +=09}
> +
> +=09ret =3D asus_ec_enable_writes(ec);
> +=09if (ret < 0)
> +=09=09return dev_err_probe(dev, ret, "Failed to enable EC direct access:=
 %d\n", ret);
> +
> +=09ret =3D asus_ec_read_version(ec, &major, &minor, &patch);
> +=09if (ret < 0)
> +=09=09return dev_err_probe(dev, ret, "Failed to read EC version: %d\n", =
ret);
> +
> +=09dev_dbg(dev, "ASUS Zenbook EC version %u.%u.%u\n", major, minor, patc=
h);
> +
> +=09ec->kbd_led.name =3D "asus::kbd_backlight";
> +=09ec->kbd_led.max_brightness =3D ASUS_EC_KBD_MAX_BRIGHTNESS;
> +=09ec->kbd_led.brightness_set_blocking =3D asus_ec_kbd_led_set;
> +=09ec->kbd_led.flags =3D LED_CORE_SUSPENDRESUME;
> +
> +=09ret =3D devm_led_classdev_register(dev, &ec->kbd_led);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to register keyboard LED\n"=
);
> +
> +=09ret =3D devm_request_threaded_irq(dev, client->irq, NULL, asus_ec_irq=
,
> +=09=09=09=09=09IRQF_ONESHOT, dev_name(dev), ec);
> +=09if (ret)
> +=09=09return dev_err_probe(dev, ret, "Failed to request IRQ\n");
> +
> +=09ec->hwmon_dev =3D devm_hwmon_device_register_with_info(dev,
> +=09=09=09=09=09=09=09     "asus_glymur_ec",
> +=09=09=09=09=09=09=09     ec,
> +=09=09=09=09=09=09=09     &asus_ec_hwmon_chip_info,
> +=09=09=09=09=09=09=09     NULL);
> +=09if (IS_ERR(ec->hwmon_dev)) {
> +=09=09return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
> +=09=09=09=09     "Failed to register hwmon\n");
> +=09}
> +
> +=09return 0;
> +}
> +
> +static int asus_glymur_ec_modern_standby(struct asus_ec *ec, u8 val)
> +{
> +=09guard(mutex)(&ec->lock);
> +
> +=09return i2c_smbus_write_byte_data(ec->client,
> +=09=09=09=09=09 ASUS_QCOM_EC_MODERN_STANDBY_CMD, val);
> +}
> +
> +static int asus_glymur_ec_suspend(struct device *dev)
> +{
> +=09return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
> +=09=09=09=09=09     ASUS_QCOM_EC_MODERN_STANDBY_ENTER);
> +}
> +
> +static int asus_glymur_ec_resume(struct device *dev)
> +{
> +=09return asus_glymur_ec_modern_standby(dev_get_drvdata(dev),
> +=09=09=09=09=09     ASUS_QCOM_EC_MODERN_STANDBY_EXIT);
> +}
> +
> +static DEFINE_SIMPLE_DEV_PM_OPS(asus_glymur_ec_pm_ops,
> +=09=09=09=09asus_glymur_ec_suspend,
> +=09=09=09=09asus_glymur_ec_resume);
> +
> +static const struct of_device_id asus_glymur_ec_of_match[] =3D {
> +=09{ .compatible =3D "asus,zenbook-a14-ux3407na-ec" },
> +=09{ .compatible =3D "asus,zenbook-a16-ux3607oa-ec" },
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(of, asus_glymur_ec_of_match);
> +
> +static const struct i2c_device_id asus_glymur_ec_id[] =3D {
> +=09{ "asus-glymur-ec" },
> +=09{}
> +};
> +MODULE_DEVICE_TABLE(i2c, asus_glymur_ec_id);
> +
> +static struct i2c_driver asus_glymur_ec_driver =3D {
> +=09.driver =3D {
> +=09=09.name=09=09=3D "asus-glymur-ec",
> +=09=09.of_match_table=09=3D asus_glymur_ec_of_match,
> +=09=09.pm=09=09=3D pm_sleep_ptr(&asus_glymur_ec_pm_ops),
> +=09},
> +=09.probe=09=09=3D asus_glymur_ec_probe,
> +=09.id_table=09=3D asus_glymur_ec_id,
> +};
> +module_i2c_driver(asus_glymur_ec_driver);
> +
> +MODULE_DESCRIPTION("ASUS Zenbook A16 (Qualcomm) Embedded Controller driv=
er");
> +MODULE_LICENSE("GPL");
>=20
>=20
--8323328-495338107-1792074248=:1307--
