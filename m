Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CD7F2DCF52
	for <linux-hwmon@vger.kernel.org>; Wed,  7 Jan 2026 19:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767813549; cv=none; b=dQ7HsvFpYxIzHesZH9i23Cdgqa75+3l8w9Wzid9hdUeqXy0i+prXi0dginDsnO0ZgBw8T3eX6vsYXvXTYWpA+wB2pIjb+DBRSyMH56/vXmurcWpImncdQ3LK+xH/H8/8i4bN0f/d3eA8PCNF4xxhMxopR2f+QhaFAnGWToEGTXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767813549; c=relaxed/simple;
	bh=+EmRxHThlCg2pCEvYFrKVsI491MON5UVyqp5jLeoDp8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Csv/47+cpUrlYUMSRMizAW+awo84tw3tKU/3Hv67BDZzdZ4F6inaMa0yk4K9sMk5U6bVVCHNaBIgPuRjket58IN0CPqjFlc3vusE9hIq8Wqqe9Oq9IDAZ0JRX87gvupIyxBQcph2+2FRnI8glPb4Qsn9QMQ4NRYchxfT1Yk1lac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com; spf=pass smtp.mailfrom=perenite.com; dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b=OtdiiYB+; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=perenite.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perenite.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=perenite-com.20230601.gappssmtp.com header.i=@perenite-com.20230601.gappssmtp.com header.b="OtdiiYB+"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-37d96f97206so18963031fa.3
        for <linux-hwmon@vger.kernel.org>; Wed, 07 Jan 2026 11:19:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1767813545; x=1768418345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYrgs7nBDupcJayXwff8gTynCVcuYkcQv/zIbteI9R0=;
        b=OtdiiYB+fo3DF6J2BLq9+byRRxR1Yu8WthAaPxDqIZvE2kWucoaip5ripy/qjIPF6h
         9Ti+wD2qEYig/SDOXc3TgI3FL9yK2gZ9S9zkFDmfSa/bk7qusPJjkMOWDVYS+xmCqzJM
         qkj6PNG0HcgMHrDUDElKKVlbpCuH1l89z7usFUsFyrsb3r1K1UouiB7RWlRDq2j7Oe2N
         nbtF1QGqCQuhPFRpFL7jOExudu9b095AGD8/Gf/3/3y9n2ZPRD7f4oN45qv8ajErwtwZ
         9Q2ef531IrOU12AiLxDL8WQoKmpUJUVxzBzGSCCXbhpXiWlz8hQfQFO9RuWNmtD+zUbz
         d71g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767813545; x=1768418345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fYrgs7nBDupcJayXwff8gTynCVcuYkcQv/zIbteI9R0=;
        b=w68KsYo2/SMUT3MJYXmAQdTM0HDVTAS5eFKkW8y+xgWblH5U852w+JAsfimZaiO8UW
         gWB2G4OL6JN/L8VkJFEwQbnJ07+aDxpiunsHsJFGDX7WNkYWI+JRJdZwQBL2H4tZEH+m
         chawebSQPZu7d2D4F307wmMtlY35n383uIgVrYtPFtbB01v4oPy/mdDlKka4NxjETl8m
         NuwyIYMI9DZanYSE2wCp4hVXFmZYLSKnyxJpxJRmyUQm48ZG24ml2m0mxHoKES3J1Qpc
         InHTMCUzYm19E78Q6FWbEtg+pvdugETJCiccl6tKmELyov5sw2olsxqgUU8PC0xd/vKd
         U/kA==
X-Forwarded-Encrypted: i=1; AJvYcCVEuvmBilzEl80mWzOTT+Tftyc+5v3e1j3nuwbMQ5YAZG75LG1/Rf7v1gOrt2iE+LIfyiNRi9knDsIvgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzD5cSXV/bBSp+toxe0Jt7f5+mAkxZqHjhz3LVQYVBBu2n1uoKg
	ZiYVsHLpRV96VIU6sRXqF8Xzj5bwQ+RLz5SviDp/7k7EIN5//9R+9A6LxoDvkyLwcuK73hqBIPz
	cH/PAfuT8LibRk6wkV4k+cnHd7mq25jKdoCapvTL3
X-Gm-Gg: AY/fxX5BP0qtSPEfpjMtYjFYi9XrgJKbM2ZCJG3j04HzSfvLv6I8BSG5sYDcqexhQbO
	OiHne6RXTXCN8m06eX4W/hwPAk0VnJspl+h5dqC5UXV0tRWL9ZE+JPVPSazMBBZyof3ZCTept2m
	LVrmbIAXlsc6U1czioXR9gpcRo3ahvJb5p+CGvXXAiCiaTcepxOOFwG7JBD+CnZIOdOjYbrpaCc
	iEjMAmP7VXPd/+Wi5M5yspHfpfas8pG015/Vlwd3FN+EtJG+4vZ3iflyz9JVd0GHXBUKVA=
X-Google-Smtp-Source: AGHT+IFHID1uNhIC4O5ZG8p5SblpBJzUzz3ylaPWyBKkOu5jVr/jLUFMipA6M+n7v+swaN0PmYR6Yj2uBnIir/C+iPY=
X-Received: by 2002:a05:651c:505:b0:382:f4aa:8432 with SMTP id
 38308e7fff4ca-382ff85b992mr10974451fa.39.1767813544823; Wed, 07 Jan 2026
 11:19:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251226203021.27244-1-yahoo@perenite.com> <202512300415.VRCQoZYs-lkp@intel.com>
In-Reply-To: <202512300415.VRCQoZYs-lkp@intel.com>
From: Benoit Masson <yahoo@perenite.com>
Date: Wed, 7 Jan 2026 20:18:53 +0100
X-Gm-Features: AQt7F2qG9qETku47XoHfuzhMFcc-VZz0jwxWXRO0T_mKtC2D13Ex0ihz0VRoWcw
Message-ID: <CAGHj7OJ=XoSSksz5DbpnP-eB3dQor0zqoXezbYRocFrqj+RTuQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, jdelvare@suse.com, 
	Guenter Roeck <linux@roeck-us.net>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 5, 2026 at 11:10=E2=80=AFAM Dan Carpenter <dan.carpenter@linaro=
.org> wrote:
>
> Hi benoit.masson,
>
> kernel test robot noticed the following build warnings:
>
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/benoit-masson/hwmo=
n-it87-describe-per-chip-temperature-resources/20251227-043108
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-stag=
ing.git hwmon-next
> patch link:    https://lore.kernel.org/r/20251226203021.27244-1-yahoo%40p=
erenite.com
> patch subject: [PATCH] hwmon: it87: describe per-chip temperature resourc=
es
> config: x86_64-randconfig-161-20251229 (https://download.01.org/0day-ci/a=
rchive/20251230/202512300415.VRCQoZYs-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202512300415.VRCQoZYs-lkp@intel.com/
>
> smatch warnings:
> drivers/hwmon/it87.c:1694 show_pwm_temp_map() warn: variable dereferenced=
 before IS_ERR check 'data' (see line 1691)
>
> vim +/data +1694 drivers/hwmon/it87.c
>
> 94ac7ee616809d Jean Delvare   2010-03-05  1685  static ssize_t show_pwm_t=
emp_map(struct device *dev,
> 94ac7ee616809d Jean Delvare   2010-03-05  1686                           =
        struct device_attribute *attr, char *buf)
> 94ac7ee616809d Jean Delvare   2010-03-05  1687  {
> 94ac7ee616809d Jean Delvare   2010-03-05  1688          struct sensor_dev=
ice_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
> 94ac7ee616809d Jean Delvare   2010-03-05  1689          struct it87_data =
*data =3D it87_update_device(dev);
> c962024e306ed5 Guenter Roeck  2015-04-04  1690          int nr =3D sensor=
_attr->index;
> 542f1e57c17849 benoit.masson  2025-12-26 @1691          u8 num_map =3D da=
ta->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
>                                                                      ^^^^=
^^^^^^^^^^^^^^
> Unchecked dereference
>
> 94ac7ee616809d Jean Delvare   2010-03-05  1692          int map;
> 94ac7ee616809d Jean Delvare   2010-03-05  1693
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16 @1694          if (IS_ERR(data))
>                                                                    ^^^^
> Checked too late.
>
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1695                  return PT=
R_ERR(data);
> 0282ba4a4fe6c8 Frank Crawford 2023-04-16  1696
> 0624d861983c2c Guenter Roeck  2015-04-06  1697          map =3D data->pwm=
_temp_map[nr];
>

Hi Dan,

Indeed I=E2=80=99d move the num_map assignment below the IS_ERR(data)

Is proposing a new patch V2 below the right appraoch ?

Thanks

[PATCH v2] hwmon: it87: describe per-chip temperature resources

Signed-off-by: benoit.masson <yahoo@perenite.com>
---
drivers/hwmon/it87.c | 51 ++++++++++++++++++++++++++++++++++-----------
1 file changed, 38 insertions(+), 13 deletions(-)

diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
index e233aafa8856..f9eca0bc02bc 100644
--- a/drivers/hwmon/it87.c
+++ b/drivers/hwmon/it87.c
@@ -54,6 +54,7 @@
#include <linux/hwmon-vid.h>
#include <linux/err.h>
#include <linux/mutex.h>
+#include <linux/minmax.h>
#include <linux/sysfs.h>
#include <linux/string.h>
#include <linux/dmi.h>
@@ -279,8 +280,9 @@ static const u8 IT87_REG_AUTO_BASE[] =3D { 0x60,
0x68, 0x70, 0x78, 0xa0, 0xa8 };
#define NUM_VIN ARRAY_SIZE(IT87_REG_VIN)
#define NUM_VIN_LIMIT 8
#define NUM_TEMP 6
-#define NUM_TEMP_OFFSET ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
-#define NUM_TEMP_LIMIT 3
+#define IT87_TEMP_OFFSET_MAX ARRAY_SIZE(IT87_REG_TEMP_OFFSET)
+#define IT87_TEMP_LIMIT_DEFAULT 3
+#define IT87_TEMP_MAP_DEFAULT 3
#define NUM_FAN ARRAY_SIZE(IT87_REG_FAN)
#define NUM_FAN_DIV 3
#define NUM_PWM ARRAY_SIZE(IT87_REG_PWM)
@@ -290,6 +292,9 @@ struct it87_devices {
const char *name;
const char * const model;
u32 features;
+ u8 num_temp_limit;
+ u8 num_temp_offset;
+ u8 num_temp_map;
u8 peci_mask;
u8 old_peci_mask;
u8 smbus_bitmap; /* SMBus enable bits in extra config register */
@@ -578,6 +583,9 @@ struct it87_data {
int sioaddr;
enum chips type;
u32 features;
+ u8 num_temp_limit;
+ u8 num_temp_offset;
+ u8 num_temp_map;
u8 peci_mask;
u8 old_peci_mask;
@@ -926,12 +934,13 @@ static struct it87_data
*it87_update_device(struct device *dev)
data->temp[i][0] =3D
it87_read_value(data, IT87_REG_TEMP(i));
- if (has_temp_offset(data) && i < NUM_TEMP_OFFSET)
+ if (has_temp_offset(data) &&
+ i < data->num_temp_offset)
data->temp[i][3] =3D
it87_read_value(data,
IT87_REG_TEMP_OFFSET[i]);
- if (i >=3D NUM_TEMP_LIMIT)
+ if (i >=3D data->num_temp_limit)
continue;
data->temp[i][1] =3D
@@ -1679,16 +1688,18 @@ static ssize_t show_pwm_temp_map(struct device *dev=
,
struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
struct it87_data *data =3D it87_update_device(dev);
int nr =3D sensor_attr->index;
+ u8 num_map;
int map;

if (IS_ERR(data))
return PTR_ERR(data);

+ num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
map =3D data->pwm_temp_map[nr];
- if (map >=3D 3)
+ if (map >=3D num_map)
map =3D 0; /* Should never happen */
- if (nr >=3D 3) /* pwm channels 3..6 map to temp4..6 */
- map +=3D 3;
+ if (nr >=3D num_map) /* pwm channels 3..6 map to temp4..6 */
+ map +=3D num_map;
return sprintf(buf, "%d\n", (int)BIT(map));
}
@@ -1700,6 +1710,7 @@ static ssize_t set_pwm_temp_map(struct device *dev,
struct sensor_device_attribute *sensor_attr =3D to_sensor_dev_attr(attr);
struct it87_data *data =3D dev_get_drvdata(dev);
int nr =3D sensor_attr->index;
+ u8 num_map =3D data->num_temp_map ?: IT87_TEMP_MAP_DEFAULT;
long val;
int err;
u8 reg;
@@ -1707,8 +1718,8 @@ static ssize_t set_pwm_temp_map(struct device *dev,
if (kstrtol(buf, 10, &val) < 0)
return -EINVAL;
- if (nr >=3D 3)
- val -=3D 3;
+ if (nr >=3D num_map)
+ val -=3D num_map;
switch (val) {
case BIT(0):
@@ -3206,7 +3217,7 @@ static void it87_check_limit_regs(struct it87_data *d=
ata)
if (reg =3D=3D 0xff)
it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
}
- for (i =3D 0; i < NUM_TEMP_LIMIT; i++) {
+ for (i =3D 0; i < data->num_temp_limit; i++) {
reg =3D it87_read_value(data, IT87_REG_TEMP_HIGH(i));
if (reg =3D=3D 0xff)
it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
@@ -3399,6 +3410,7 @@ static int it87_probe(struct platform_device *pdev)
struct resource *res;
struct device *dev =3D &pdev->dev;
struct it87_sio_data *sio_data =3D dev_get_platdata(dev);
+ const struct it87_devices *chip;
int enable_pwm_interface;
struct device *hwmon_dev;
int err;
@@ -3421,9 +3433,21 @@ static int it87_probe(struct platform_device *pdev)
data->type =3D sio_data->type;
data->smbus_bitmap =3D sio_data->smbus_bitmap;
data->ec_special_config =3D sio_data->ec_special_config;
- data->features =3D it87_devices[sio_data->type].features;
- data->peci_mask =3D it87_devices[sio_data->type].peci_mask;
- data->old_peci_mask =3D it87_devices[sio_data->type].old_peci_mask;
+ chip =3D &it87_devices[sio_data->type];
+ data->features =3D chip->features;
+ data->peci_mask =3D chip->peci_mask;
+ data->old_peci_mask =3D chip->old_peci_mask;
+ data->num_temp_limit =3D chip->num_temp_limit ?
+ chip->num_temp_limit : IT87_TEMP_LIMIT_DEFAULT;
+ if (chip->num_temp_offset)
+ data->num_temp_offset =3D min(chip->num_temp_offset,
+ (u8)IT87_TEMP_OFFSET_MAX);
+ else if (has_temp_offset(data))
+ data->num_temp_offset =3D IT87_TEMP_OFFSET_MAX;
+ else
+ data->num_temp_offset =3D 0;
+ data->num_temp_map =3D chip->num_temp_map ?
+ chip->num_temp_map : IT87_TEMP_MAP_DEFAULT;
/*
* IT8705F Datasheet 0.4.1, 3h =3D=3D Version G.
* IT8712F Datasheet 0.9.1, section 8.3.5 indicates 8h =3D=3D Version J.
