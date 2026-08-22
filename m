Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6401536212C
	for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 18:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787424442; cv=pass; b=ClKvyG2ORMxnJB8Ox3J6s17kQ1E7Ny8dMqEg+hyHj0jpZqYuo7SQx6C03UIEC2fZPxx/DWrQSPehHDo6OgaR9sEs/vquTzz+DQwUamQeOwrG6SIjHNOpYWO3/SOVezk/V51qFs1NzBzHHT1WByn6uyEsj/1ybxEQ77+LDo57yWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787424442; c=relaxed/simple;
	bh=SqYA+xrSNIwDSqnvmQwDloWNENsJGv8IhWCNZDVnYNc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dq++hPqquIn5uZPnTt96Czs8YeH+OPxO9DV4/d3tEVtaC/M6w8t9fNWzETaPCfPwEVm504KLYkQ49E39cK2HlMJOJKeuH3C19wwRp293lTKLmRmpHbM/KOpue+woYCJ+dU5PVD7yyUswBXRA1940c2UFosFv1bLdwIMkYW/vFPM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4iNC9aw; arc=pass smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4iNC9aw"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2d01663d816so18048345ad.1
        for <linux-hwmon@vger.kernel.org>; Sat, 22 Aug 2026 11:47:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787424439; cv=none;
        d=google.com; s=arc-20260327;
        b=skllFjcZV6TiBBvks+LZXXBLqcp6LYd2otkWhV8kOcqjGXTb0JeGG7DFEpljSOqndb
         I/wOFw2m53ePM/KwR7D4H3qXVtjyEW8HpO+4f6ZKY9c6HN11/VpbaIme/FyRm0Yhjhf6
         C3tHPt2sJtD2SyobjmkfCpIGHXN52+miX55NSMMneq3eSZ82k+NeQGiVX3cYMxaerqod
         EdBdccq7ZS9P/1VA2JDcxyjiNmUZRejR3UcURSEUDu5IYjloCDQtMvycy439rSZd+D2R
         DDM9eLC1XHRk048b3CHDfpIqKIFS1Xm59pjUfcTKiAjTUHg9TZ2svRSPnGwN9+Hv0t7u
         hryQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=2ZnVvTuz44zTk+c+dbE23gRGAIH5d61VMcyOrdSbVKg=;
        fh=v+LJdy2XuRtc/jyW9yNXz1OU1BHk98EjQekdf3YJlcQ=;
        b=ZcVGN7iURJUcFMDvaB0I8s9H2v6WpKpN+IJHOTAdESYH/jNgsb/kdiZlYGgh0FhxVI
         9y2Pc0Pr/q38PjsHqZo1Arb+0WTSUIiNhxCR+NrPGMXKlcobR7v4XZ6KBSSNACftstRD
         HuaLSPDRND9jppwO0o92tLTNgOtjskaqIbvIZX3zu5weoWBtkqaibgEek69tZWz2bnwD
         t8yyI8ZOCZ0/oJuOocfGrLbc4c5HjLcwK/xWfZHV0uxC/tG/wyGrI/Fx2reOwUJT99hO
         iuJmjCFN6ixUiRqQjmuc0aBV8qXXBiW7nA+1SAl5IFs+AV2j9QyihXE/l5QQJ6nIV8AD
         XggA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787424439; x=1788029239; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2ZnVvTuz44zTk+c+dbE23gRGAIH5d61VMcyOrdSbVKg=;
        b=H4iNC9awDXw/NIlL71Gvw9nDszRoDNL33A2jWVbtJr5Vph++eT+ed2iw0nBktJPbPk
         AL0bWrltqavkVwqCef0DenMUCxkorhr6Khx1ArekA1tDCDZiPFP4TvLRbS+XbE/dqnmw
         5IZR2B6gGtF8s6wUBSabILBZqZo9tF2oObwESycw6wuAvLuN9AtPhoALCFm5Z0iGeULF
         uA6kVhbdz7SwZ20tAzQXnD6iRJd7g0l+RWuvxJYwj3p3PzU+EQJ9fwGmafPo4uBLR/EB
         9A/uKqUPEidiljti6CLRI1zxXxe1VZMLZS2oHKu7af431TYT0Ib5iFeX5Y+KLOJZ0KLb
         LgJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787424439; x=1788029239;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2ZnVvTuz44zTk+c+dbE23gRGAIH5d61VMcyOrdSbVKg=;
        b=qlg2OYcUWJ+jZ3pkWzQapogM7ROYo5rRstVGMFnOE1+HTUqlTEvp+c+13FsCC59OgY
         vio+s1QLyS7VS90Sb/cRTcivrrGncFmg8WJJkx4XsERVUVfrgxcmnksbdLDxqm0n0KwI
         MLM3Rg9lqWpdUzoVkh52tPN8FqCLghvPxs4Yoow/raaaXkOeoZt3/7eih23V3mt+5eNI
         6iD2BoVb/Ywkvw8zYAGrpy8PTvk0z5EnU1295n2vnMVmkTQExqTE1W9tMHIM58JqlU9U
         hB0Lv9T1JLddBvFTfNjJE+NQDhwRGV3x8To20AhQ3TI3+7kphh6oW9f2kZ5I0etePpyu
         yyQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rr4b1O8ymEiXcHZ59pQkMRh7vIRfm3TpcvV1cj46PPJezagKZQZWHYI21TUzgqJRk3tgj6q7eXUpCDPTQ==@vger.kernel.org
X-Gm-Message-State: AFuF++n5dlmhDL23F7MBNhR1zCzAOkBkYbTTzXs6F40LT0uZMcOt5qhf
	mJZY1vyw2+TivO3+8V9JB7mh/ODp7/53Y5AmzfzLEndwrNyNKoy4iSuhR0E1mZFDDsrGLjz3HCb
	MUcwq3zi3i65hs6Ue261WNAeJz0JZ+qo=
X-Gm-Gg: AR+sD11C5FDE3M6DsWlgndSO5fw9EMnD9IuPUU7GMBdp+UDKm18qe4Oc+0cbIWHb50a
	MbQo7OnePh6+VLETCnUIDsQOQu9xCabxBdX2GRE4UqQaLNjBsYZq6K5InuDnwbMhiDDMjyK15De
	hd09FJGEuPg07m1iJ4ShaIWKm6tBFPE4AcW46F03XRRIa1Yi8+zl3ubNS651AnYCgZQoA/ZQh4y
	aS9ylfUwAKzaHliXFBntS5K2nn/Pq7CQT8EyICg9Ua7/ffMbFI/a8a4B2QFzedZLNO+pgmER/HK
	YcikicNLRym2i/QJ1MMrtE0LbP25EM6mpnI/7AGP7xd8BqOovxBxaQkUWES8yQzyl8r/ADpjYYy
	/d27GOlMFiKUJz6GVurq7TurmU5aGsV73Kj3ovNw/QP6DPchVtmIQiwu4O84ELkMTelAjn20K5Y
	cZJIPCzfw4fIE=
X-Received: by 2002:a17:902:e546:b0:2c8:2808:3ec9 with SMTP id
 d9443c01a7336-2d64b0c4e5cmr223275095ad.12.1787424439258; Sat, 22 Aug 2026
 11:47:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260821214728.87773-1-mradityadash@gmail.com> <20260821214728.87773-4-mradityadash@gmail.com>
In-Reply-To: <20260821214728.87773-4-mradityadash@gmail.com>
From: Antheas Kapenekakis <kapenekakis@gmail.com>
Date: Sat, 22 Aug 2026 20:47:07 +0200
X-Gm-Features: AcwNN1UJGr0JSBs4MdJd51u4kAuYrKbikEHTo-L8F5xk5K9ymkiIuQltWNJpqdk
Message-ID: <CAGwozwFNanrMj4TG1LuxQmRzVXfqc-3Veridf_Xy73DeOO8k8g@mail.gmail.com>
Subject: Re: [RFC PATCH 3/3] platform/x86: lenovo: Add Legion Go Fan Method
 curve driver
To: Aditya Dash <mradityadash@gmail.com>
Cc: "Derek J. Clark" <derekjohn.clark@gmail.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hansg@kernel.org>, 
	Mark Pearson <mpearson-lenovo@squebb.ca>, Guenter Roeck <linux@roeck-us.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 21 Aug 2026 at 23:47, Aditya Dash <mradityadash@gmail.com> wrote:
>
> Legion Go firmware keeps its custom fan curve in a separate Fan Method WMI
> interface. Method 5 returns ten control values and ten temperatures, while
> Method 6 replaces the complete table.

10 is a value that is returned to you by the WMI array (it is the
first value), you actually do not know if the driver supports 10
points. You should validate this somehow and perhaps exit. An init
check during probe calling the getter and seeing if it displays an
error because of point mismatch to bail the driver should suffice, and
should allow you to keep complex arbitrary point logic out of the
driver.

> The GUID also appears on Lenovo systems with a different table layout.
> Limit the driver to Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2,
> Legion Go S 8ARP1, and Legion Go S 8APU1 products. These products use the
> same ten-point layout and Method 6 request.
>
> The curve applies to the same fan as the existing Other Mode attributes.
> Add a separate WMI driver and attach the ten automatic-point pairs to the
> HWMON device that Other Mode already provides. Match devices from the same
> WMI provider. Other Mode continues to work without Fan Method. Probe does
> not invoke either method.
>
> Validate both counts, every control value, and the complete temperature
> table before using a Method 5 reply. A point write holds the mutex while
> it reads the current table, changes one control value, and submits the
> complete Method 6 request. The other values remain unchanged.
>
> The HWMON mapping is not clear. On the tested Legion Go 8APU1, the fan
> responds to values from 0 through 115. This is Lenovo's 0 through 115
> percent range. Lenovo software shows 0 through 100 percent to the user,
> and 115 reaches the RPM observed in Full Speed mode. Firmware accepts
> values through 255, but values above 115 caused no observed RPM increase.

You should tighten this description and preferably rewrite it by hand.

> This RFC exposes the firmware values unchanged. The fixed temperatures are
> read-only.

Drop this sentence. If you need to describe the RFC, do it in the cover letter.

> Assisted-by: Pi:gpt-5.6-sol
> Signed-off-by: Aditya Dash <mradityadash@gmail.com>
> ---
>  .../wmi/devices/lenovo-wmi-fan-method.rst     |  34 ++
>  .../wmi/devices/lenovo-wmi-other.rst          |   3 +
>  MAINTAINERS                                   |   1 +
>  drivers/platform/x86/lenovo/Kconfig           |  11 +
>  drivers/platform/x86/lenovo/Makefile          |   1 +
>  drivers/platform/x86/lenovo/wmi-fan-method.c  | 380 ++++++++++++++++++
>  drivers/platform/x86/lenovo/wmi-other.c       |  97 ++++-
>  7 files changed, 520 insertions(+), 7 deletions(-)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  create mode 100644 drivers/platform/x86/lenovo/wmi-fan-method.c
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-fan-method.rst b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> new file mode 100644
> index 000000000000..67c9a92ed992
> --- /dev/null
> +++ b/Documentation/wmi/devices/lenovo-wmi-fan-method.rst
> @@ -0,0 +1,34 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +==================================
> +Lenovo Fan Method WMI Driver
> +==================================
> +
> +WMI GUID ``92549549-4BDE-4F06-AC04-CE8BF898DBAA``
> +
> +The Lenovo Fan Method interface provides a ten-point firmware fan table on
> +Legion Go 8APU1, Legion Go 8ASP2, Legion Go 8AHP2, Legion Go S 8ARP1, and
> +Legion Go S 8APU1 products.
> +
> +The driver adds ``pwm1_auto_point1_*`` through
> +``pwm1_auto_point10_*`` to the HWMON device that the Lenovo Other Mode driver
> +owns. The temperature attributes are fixed and read-only. They contain points
> +from 10 through 100 degrees Celsius in 10-degree steps.
> +
> +Each ``pwm1_auto_point*_pwm`` attribute is read-write and passes a firmware
> +control value from 0 through 255 without scaling. On the tested Legion Go
> +8APU1, the hardware responds from 0 through 115, corresponding to Lenovo's
> +0 through 115 percent range. Lenovo software shows 0 through 100 percent to
> +the user, and 115 percent reaches the RPM observed in Full Speed mode. The
> +firmware accepts values through 255, but values above 115 caused no observed
> +RPM increase.
> +
> +A control-value read validates both ten-entry tables before returning data. A
> +point write reads the current table, changes one control value, and submits the
> +complete request. It preserves the other nine control values and all returned
> +temperatures.
> +
> +The Fan Method and Other Mode drivers use separate modules and WMI devices.
> +The component framework associates devices that belong to the same WMI
> +provider. Fan Method curve attributes are absent when either interface is not
> +available.
>
> diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
> index c93e9e6f3fd0..34352dbd6fb9 100644
> --- a/Documentation/wmi/devices/lenovo-wmi-other.rst
> +++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
> @@ -60,6 +60,9 @@ Some Legion Go firmware does not advertise fan 1 RPM through Capability
>  Data. In that case, the driver reads Other Mode feature ``0x04030001`` for
>  ``fan1_input``. Value ``0xffffffff`` means that RPM is unavailable.
>
> +When the separate Lenovo Fan Method driver binds to the same WMI provider, it
> +adds ten automatic fan-curve points to this HWMON device.
> +
>  LENOVO_CAPABILITY_DATA_01
>  -------------------------
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 3820b286f09f..8612c2323540 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14689,6 +14689,7 @@ M:      Mark Pearson <mpearson-lenovo@squebb.ca>
>  M:     Derek J. Clark <derekjohn.clark@gmail.com>
>  L:     platform-driver-x86@vger.kernel.org
>  S:     Maintained
> +F:     Documentation/wmi/devices/lenovo-wmi-fan-method.rst
>  F:     Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  F:     Documentation/wmi/devices/lenovo-wmi-other.rst
>  F:     drivers/platform/x86/lenovo/*
> diff --git a/drivers/platform/x86/lenovo/Kconfig b/drivers/platform/x86/lenovo/Kconfig
> index 4443f40ef8aa..e69942ce3093 100644
> --- a/drivers/platform/x86/lenovo/Kconfig
> +++ b/drivers/platform/x86/lenovo/Kconfig
> @@ -276,3 +276,14 @@ config LENOVO_WMI_TUNING
>
>           To compile this driver as a module, choose M here: the module will
>           be called lenovo-wmi-other.
> +
> +config LENOVO_WMI_FAN_METHOD
> +       tristate "Lenovo Fan Method WMI Driver"
> +       depends on DMI
> +       depends on LENOVO_WMI_TUNING
> +       help
> +         Say Y here to add the firmware fan table on supported Lenovo
> +         Legion Go products to the Lenovo Other Mode HWMON device.
> +
> +         To compile this driver as a module, choose M here: the module will
> +         be called lenovo-wmi-fan-method.
> diff --git a/drivers/platform/x86/lenovo/Makefile b/drivers/platform/x86/lenovo/Makefile
> index 91a9370f11b3..171a19e01479 100644
> --- a/drivers/platform/x86/lenovo/Makefile
> +++ b/drivers/platform/x86/lenovo/Makefile
> @@ -17,6 +17,7 @@ lenovo-target-$(CONFIG_LENOVO_WMI_EVENTS)     += wmi-events.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_HELPERS)     += wmi-helpers.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_GAMEZONE)    += wmi-gamezone.o
>  lenovo-target-$(CONFIG_LENOVO_WMI_TUNING)      += wmi-other.o
> +lenovo-target-$(CONFIG_LENOVO_WMI_FAN_METHOD)  += wmi-fan-method.o
>
>  # Add 'lenovo' prefix to each module listed in lenovo-target-*
>  define LENOVO_OBJ_TARGET
> diff --git a/drivers/platform/x86/lenovo/wmi-fan-method.c b/drivers/platform/x86/lenovo/wmi-fan-method.c
> new file mode 100644
> index 000000000000..4f29c4134caf
> --- /dev/null
> +++ b/drivers/platform/x86/lenovo/wmi-fan-method.c
> @@ -0,0 +1,380 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Lenovo Fan Method WMI interface driver.
> + *
> + * This driver exposes the firmware fan table through HWMON automatic-point
> + * attributes on selected Lenovo Legion Go products.
> + */
> +
> +#include <linux/cleanup.h>
> +#include <linux/component.h>
> +#include <linux/device.h>
> +#include <linux/dmi.h>
> +#include <linux/err.h>
> +#include <linux/kernel.h>
> +#include <linux/limits.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sysfs.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <linux/wmi.h>
> +
> +#define LENOVO_FAN_METHOD_GUID "92549549-4BDE-4F06-AC04-CE8BF898DBAA"
> +
> +#define LENOVO_FAN_METHOD_GET_CURVE    5
> +#define LENOVO_FAN_METHOD_SET_CURVE    6
> +#define LENOVO_FAN_CURVE_POINTS                10
> +#define LENOVO_FAN_CURVE_REPLY_SIZE    88
> +#define LENOVO_FAN_CURVE_WRITE_SIZE    64
> +
> +#define LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET    0
> +#define LENOVO_FAN_REPLY_SPEED_OFFSET          4
> +#define LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET     44
> +#define LENOVO_FAN_REPLY_TEMP_OFFSET           48
> +
> +#define LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET    2
> +#define LENOVO_FAN_WRITE_SPEED_OFFSET          6
> +#define LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET      26
> +#define LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET     27
> +#define LENOVO_FAN_WRITE_TEMP_OFFSET           31
> +#define LENOVO_FAN_WRITE_TRAILER_OFFSET                51
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET  53
> +
> +#define LENOVO_FAN_WRITE_TEMP_TYPE             1
> +#define LENOVO_FAN_WRITE_TRAILER               0x5a
> +#define LENOVO_FAN_WRITE_TRAILER_VALUE         100
> +
> +static const struct dmi_system_id lwmi_fan_dmi_table[] = {
> +       {
> +               .ident = "Lenovo Legion Go 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8APU1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8APU1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go S 8ARP1",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go S 8ARP1"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8ASP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8ASP2"),
> +               },
> +       },
> +       {
> +               .ident = "Lenovo Legion Go 8AHP2",
> +               .matches = {
> +                       DMI_MATCH(DMI_SYS_VENDOR, "LENOVO"),
> +                       DMI_EXACT_MATCH(DMI_PRODUCT_VERSION, "Legion Go 8AHP2"),
> +               },
> +       },
> +       {}
> +};

Unless proven to be necessary, drop the dmi table. Autodetection
should suffice until devices are discovered with this functionality.

> +
> +static const u16 lwmi_fan_temperatures[LENOVO_FAN_CURVE_POINTS] = {
> +       10, 20, 30, 40, 50, 60, 70, 80, 90, 100
> +};

I think you should read those from WMI instead of hardcoding them.
Even though you should block writes as you do.

> +
> +struct lwmi_fan_method_curve {
> +       u16 speed[LENOVO_FAN_CURVE_POINTS];
> +       u16 temperature[LENOVO_FAN_CURVE_POINTS];
> +};
> +
> +struct lwmi_fan_method_priv;
> +
> +struct lwmi_fan_method_attr {
> +       struct device_attribute dev_attr;
> +       struct lwmi_fan_method_priv *priv;
> +       u8 index;
> +};
> +
> +struct lwmi_fan_method_priv {
> +       struct wmi_device *wdev;
> +       struct mutex lock; /* Serializes all Fan Method calls. */
> +       struct lwmi_fan_method_attr point_attrs[LENOVO_FAN_CURVE_POINTS * 2];
> +       struct attribute *attrs[LENOVO_FAN_CURVE_POINTS * 2 + 1];
> +       struct attribute_group group;
> +};
> +
> +static int lwmi_fan_method_get_curve(struct lwmi_fan_method_priv *priv,
> +                                    struct lwmi_fan_method_curve *curve)
> +{
> +       u8 input[] = { 1, 1 };
> +       struct wmi_buffer in = {
> +               .length = sizeof(input),
> +               .data = input,
> +       };
> +       struct wmi_buffer out = {};
> +       const u8 *buffer;
> +       int ret, i;
> +
> +       ret = wmidev_invoke_method(priv->wdev, 0,
> +                                  LENOVO_FAN_METHOD_GET_CURVE, &in, &out,
> +                                  LENOVO_FAN_CURVE_REPLY_SIZE);
> +       if (ret)
> +               return ret;
> +
> +       buffer = out.data;
> +       if (get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_COUNT_OFFSET) !=
> +           LENOVO_FAN_CURVE_POINTS ||
> +           get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_COUNT_OFFSET) !=
> +           LENOVO_FAN_CURVE_POINTS) {
> +               ret = -ERANGE;
> +               goto out_free;
> +       }
> +
> +       for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +               u32 speed = get_unaligned_le32(buffer + LENOVO_FAN_REPLY_SPEED_OFFSET +
> +                                              i * sizeof(u32));
> +               u32 temperature =
> +                       get_unaligned_le32(buffer + LENOVO_FAN_REPLY_TEMP_OFFSET +
> +                                          i * sizeof(u32));
> +
> +               if (speed > U8_MAX || temperature != lwmi_fan_temperatures[i]) {
> +                       ret = -ERANGE;
> +                       goto out_free;
> +               }
> +
> +               curve->speed[i] = speed;
> +               curve->temperature[i] = temperature;
> +       }
> +
> +out_free:
> +       kfree(out.data);
> +       return ret;
> +}
> +
> +static int lwmi_fan_method_set_curve(struct lwmi_fan_method_priv *priv,
> +                                    const struct lwmi_fan_method_curve *curve)
> +{
> +       u8 buffer[LENOVO_FAN_CURVE_WRITE_SIZE] = { 0xff, 0x01 };
> +       struct wmi_buffer in = {
> +               .length = sizeof(buffer),
> +               .data = buffer,
> +       };
> +       int i;
> +
> +       put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +                          buffer + LENOVO_FAN_WRITE_SPEED_COUNT_OFFSET);
> +       for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +               put_unaligned_le16(curve->speed[i],
> +                                  buffer + LENOVO_FAN_WRITE_SPEED_OFFSET +
> +                                  i * sizeof(u16));
> +
> +       buffer[LENOVO_FAN_WRITE_TEMP_TYPE_OFFSET] = LENOVO_FAN_WRITE_TEMP_TYPE;
> +       put_unaligned_le32(LENOVO_FAN_CURVE_POINTS,
> +                          buffer + LENOVO_FAN_WRITE_TEMP_COUNT_OFFSET);
> +       for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++)
> +               put_unaligned_le16(curve->temperature[i],
> +                                  buffer + LENOVO_FAN_WRITE_TEMP_OFFSET +
> +                                  i * sizeof(u16));
> +
> +       buffer[LENOVO_FAN_WRITE_TRAILER_OFFSET] = LENOVO_FAN_WRITE_TRAILER;
> +       put_unaligned_le16(LENOVO_FAN_WRITE_TRAILER_VALUE,
> +                          buffer + LENOVO_FAN_WRITE_TRAILER_VALUE_OFFSET);
> +
> +       return wmidev_invoke_procedure(priv->wdev, 0,
> +                                      LENOVO_FAN_METHOD_SET_CURVE, &in);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_show(struct device *dev,
> +                                       struct device_attribute *attr,
> +                                       char *buf)
> +{
> +       struct lwmi_fan_method_attr *point_attr =
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +       struct lwmi_fan_method_priv *priv = point_attr->priv;
> +       struct lwmi_fan_method_curve curve;
> +       int ret;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       ret = lwmi_fan_method_get_curve(priv, &curve);
> +       if (ret)
> +               return ret;
> +
> +       return sysfs_emit(buf, "%u\n", curve.speed[point_attr->index]);
> +}
> +
> +static ssize_t lwmi_fan_method_pwm_store(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        const char *buf, size_t count)
> +{
> +       struct lwmi_fan_method_attr *point_attr =
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +       struct lwmi_fan_method_priv *priv = point_attr->priv;
> +       struct lwmi_fan_method_curve curve;
> +       unsigned long pwm;
> +       int ret;
> +
> +       ret = kstrtoul(buf, 10, &pwm);
> +       if (ret)
> +               return ret;
> +       if (pwm > U8_MAX)
> +               return -EINVAL;
> +
> +       guard(mutex)(&priv->lock);
> +
> +       ret = lwmi_fan_method_get_curve(priv, &curve);
> +       if (ret)
> +               return ret;
> +
> +       curve.speed[point_attr->index] = pwm;
> +       ret = lwmi_fan_method_set_curve(priv, &curve);
> +
> +       return ret ? ret : count;
> +}
> +
> +static ssize_t lwmi_fan_method_temp_show(struct device *dev,
> +                                        struct device_attribute *attr,
> +                                        char *buf)
> +{
> +       struct lwmi_fan_method_attr *point_attr =
> +               container_of(attr, struct lwmi_fan_method_attr, dev_attr);
> +
> +       return sysfs_emit(buf, "%u\n",
> +                         lwmi_fan_temperatures[point_attr->index] * 1000);
> +}
> +
> +#define LWMI_FAN_METHOD_POINT_NAMES(_point) \
> +       "pwm1_auto_point" #_point "_pwm", \
> +       "pwm1_auto_point" #_point "_temp"
> +
> +static const char * const lwmi_fan_method_attr_names[] = {
> +       LWMI_FAN_METHOD_POINT_NAMES(1),
> +       LWMI_FAN_METHOD_POINT_NAMES(2),
> +       LWMI_FAN_METHOD_POINT_NAMES(3),
> +       LWMI_FAN_METHOD_POINT_NAMES(4),
> +       LWMI_FAN_METHOD_POINT_NAMES(5),
> +       LWMI_FAN_METHOD_POINT_NAMES(6),
> +       LWMI_FAN_METHOD_POINT_NAMES(7),
> +       LWMI_FAN_METHOD_POINT_NAMES(8),
> +       LWMI_FAN_METHOD_POINT_NAMES(9),
> +       LWMI_FAN_METHOD_POINT_NAMES(10),
> +};
> +
> +#undef LWMI_FAN_METHOD_POINT_NAMES
> +
> +static void lwmi_fan_method_attrs_init(struct lwmi_fan_method_priv *priv)
> +{
> +       int i;
> +
> +       for (i = 0; i < LENOVO_FAN_CURVE_POINTS; i++) {
> +               struct lwmi_fan_method_attr *pwm = &priv->point_attrs[i * 2];
> +               struct lwmi_fan_method_attr *temp = &priv->point_attrs[i * 2 + 1];
> +
> +               sysfs_attr_init(&pwm->dev_attr.attr);
> +               pwm->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2];
> +               pwm->dev_attr.attr.mode = 0644;
> +               pwm->dev_attr.show = lwmi_fan_method_pwm_show;
> +               pwm->dev_attr.store = lwmi_fan_method_pwm_store;
> +               pwm->priv = priv;
> +               pwm->index = i;
> +               priv->attrs[i * 2] = &pwm->dev_attr.attr;
> +
> +               sysfs_attr_init(&temp->dev_attr.attr);
> +               temp->dev_attr.attr.name = lwmi_fan_method_attr_names[i * 2 + 1];
> +               temp->dev_attr.attr.mode = 0444;
> +               temp->dev_attr.show = lwmi_fan_method_temp_show;
> +               temp->index = i;
> +               priv->attrs[i * 2 + 1] = &temp->dev_attr.attr;
> +       }
> +
> +       priv->group.attrs = priv->attrs;
> +}
> +
> +static int lwmi_fan_method_master_bind(struct device *dev)
> +{
> +       struct lwmi_fan_method_priv *priv = dev_get_drvdata(dev);
> +
> +       return component_bind_all(dev, &priv->group);
> +}
> +
> +static void lwmi_fan_method_master_unbind(struct device *dev)
> +{
> +       component_unbind_all(dev, NULL);
> +}
> +
> +static const struct component_master_ops lwmi_fan_method_master_ops = {
> +       .bind = lwmi_fan_method_master_bind,
> +       .unbind = lwmi_fan_method_master_unbind,
> +};
> +
> +static int lwmi_fan_method_component_compare(struct device *dev, void *data)
> +{
> +       struct device *master = data;
> +
> +       return dev->driver &&
> +               !strcmp(dev->driver->name, "lenovo_wmi_other") &&
> +               dev->parent == master->parent;
> +}
> +
> +static int lwmi_fan_method_probe(struct wmi_device *wdev, const void *context)
> +{
> +       struct component_match *master_match = NULL;
> +       struct lwmi_fan_method_priv *priv;
> +
> +       if (!dmi_check_system(lwmi_fan_dmi_table))
> +               return -ENODEV;
> +
> +       priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
> +       if (!priv)
> +               return -ENOMEM;
> +
> +       priv->wdev = wdev;
> +       mutex_init(&priv->lock);
> +       lwmi_fan_method_attrs_init(priv);
> +       dev_set_drvdata(&wdev->dev, priv);
> +
> +       component_match_add(&wdev->dev, &master_match,
> +                           lwmi_fan_method_component_compare, &wdev->dev);
> +       if (IS_ERR(master_match))
> +               return PTR_ERR(master_match);
> +
> +       return component_master_add_with_match(&wdev->dev,
> +                                              &lwmi_fan_method_master_ops,
> +                                              master_match);
> +}
> +
> +static void lwmi_fan_method_remove(struct wmi_device *wdev)
> +{
> +       component_master_del(&wdev->dev, &lwmi_fan_method_master_ops);
> +}
> +
> +static const struct wmi_device_id lwmi_fan_method_id_table[] = {
> +       { LENOVO_FAN_METHOD_GUID, NULL },
> +       {}
> +};
> +
> +static struct wmi_driver lwmi_fan_method_driver = {
> +       .driver = {
> +               .name = "lenovo_wmi_fan_method",

I chose the name lenovo_wmi_gamezone_fan as its more explanatory, consider that

> +               .probe_type = PROBE_PREFER_ASYNCHRONOUS,
> +       },
> +       .id_table = lwmi_fan_method_id_table,
> +       .probe = lwmi_fan_method_probe,
> +       .remove = lwmi_fan_method_remove,
> +       .no_singleton = true,
> +};
> +
> +MODULE_DEVICE_TABLE(wmi, lwmi_fan_method_id_table);
> +module_wmi_driver(lwmi_fan_method_driver);
> +
> +MODULE_AUTHOR("Aditya Dash <mradityadash@gmail.com>");
> +MODULE_DESCRIPTION("Lenovo Fan Method WMI Driver");
> +MODULE_LICENSE("GPL");
> diff --git a/drivers/platform/x86/lenovo/wmi-other.c b/drivers/platform/x86/lenovo/wmi-other.c
> index b4be7739b243..72d3510b17b2 100644
> --- a/drivers/platform/x86/lenovo/wmi-other.c
> +++ b/drivers/platform/x86/lenovo/wmi-other.c

You cannot modify other drivers in the patch you introduce your
driver. If modifying wmi-other is necessary, please do it on a
separate patch leading this one with a proper explanation.
Particularly, it is not clear why we need to couple wmi-other, the
interfaces are separate. To keep the coupling simple, ideally this
driver should be standalone and not check anything. Yes, technically
only custom mode should be able to set the fan curve, but it works on
all modes for a variety of firmwares / devices so this is a loss of
functionality, and it also forces you to couple to gamezone.

> @@ -192,11 +192,13 @@ struct lwmi_om_priv {
>         struct device *fw_attr_dev;
>         struct kset *fw_attr_kset;
>         struct wmi_device *wdev;
> +       const struct attribute_group *fan_method_group;
>         int ida_id;
>
>         struct lwmi_fan_info fan_info[LWMI_FAN_NR];
>         bool fullspeed_supported;
>         bool fan0_input_fallback;
> +       bool fan_method_group_added;
>
>         struct {
>                 bool capdata00_collected : 1;
> @@ -542,6 +544,31 @@ static const struct hwmon_chip_info lwmi_om_hwmon_chip_info = {
>         .info = lwmi_om_hwmon_info,
>  };
>
> +static int lwmi_om_fan_method_group_add(struct lwmi_om_priv *priv)
> +{
> +       int ret;
> +
> +       if (!priv->hwmon_dev || !priv->fan_method_group ||
> +           priv->fan_method_group_added)
> +               return 0;
> +
> +       ret = sysfs_create_group(&priv->hwmon_dev->kobj,
> +                                priv->fan_method_group);
> +       if (!ret)
> +               priv->fan_method_group_added = true;
> +
> +       return ret;
> +}
> +
> +static void lwmi_om_fan_method_group_remove(struct lwmi_om_priv *priv)
> +{
> +       if (!priv->hwmon_dev || !priv->fan_method_group_added)
> +               return;
> +
> +       sysfs_remove_group(&priv->hwmon_dev->kobj, priv->fan_method_group);
> +       priv->fan_method_group_added = false;
> +}
> +
>  /**
>   * lwmi_om_hwmon_add() - Register HWMON device if all info is collected
>   * @priv: Driver private data
> @@ -550,9 +577,9 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>  {
>         u32 rpm;
>         long enable;
> -       int i, valid;
> +       int i, ret, valid;
>
> -       if (WARN_ON(priv->hwmon_dev))
> +       if (priv->hwmon_dev)
>                 return;
>
>         if (!priv->fan_flags.capdata00_collected || !priv->fan_flags.capdata_fan_collected) {
> @@ -592,7 +619,8 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>                 }
>         }
>
> -       if (valid == 0 && !priv->fullspeed_supported && !priv->fan0_input_fallback) {
> +       if (valid == 0 && !priv->fullspeed_supported &&
> +           !priv->fan0_input_fallback && !priv->fan_method_group) {
>                 dev_warn(&priv->wdev->dev,
>                          "fan reporting/tuning is unsupported on this device\n");
>                 return;
> @@ -609,6 +637,11 @@ static void lwmi_om_hwmon_add(struct lwmi_om_priv *priv)
>                 return;
>         }
>
> +       ret = lwmi_om_fan_method_group_add(priv);
> +       if (ret)
> +               dev_warn(&priv->wdev->dev,
> +                        "failed to register Fan Method attributes: %d\n", ret);
> +
>         dev_dbg(&priv->wdev->dev, "registered HWMON device\n");
>  }
>
> @@ -623,6 +656,7 @@ static void lwmi_om_hwmon_remove(struct lwmi_om_priv *priv)
>         if (!priv->hwmon_dev)
>                 return;
>
> +       lwmi_om_fan_method_group_remove(priv);
>         hwmon_device_unregister(priv->hwmon_dev);
>         priv->hwmon_dev = NULL;
>  }
> @@ -1801,10 +1835,44 @@ static const struct component_master_ops lwmi_om_master_ops = {
>         .unbind = lwmi_om_master_unbind,
>  };
>
> +static int lwmi_om_fan_method_component_bind(struct device *component,
> +                                            struct device *master, void *data)
> +{
> +       const struct attribute_group *group = data;
> +       struct lwmi_om_priv *priv = dev_get_drvdata(component);
> +       int ret;
> +
> +       if (!group)
> +               return -EINVAL;
> +
> +       priv->fan_method_group = group;
> +       lwmi_om_hwmon_add(priv);
> +       ret = lwmi_om_fan_method_group_add(priv);
> +       if (ret)
> +               priv->fan_method_group = NULL;
> +
> +       return ret;
> +}
> +
> +static void lwmi_om_fan_method_component_unbind(struct device *component,
> +                                               struct device *master, void *data)
> +{
> +       struct lwmi_om_priv *priv = dev_get_drvdata(component);
> +
> +       lwmi_om_fan_method_group_remove(priv);
> +       priv->fan_method_group = NULL;
> +}
> +
> +static const struct component_ops lwmi_om_fan_method_component_ops = {
> +       .bind = lwmi_om_fan_method_component_bind,
> +       .unbind = lwmi_om_fan_method_component_unbind,
> +};
> +
>  static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>  {
>         struct component_match *master_match = NULL;
>         struct lwmi_om_priv *priv;
> +       int ret;
>
>         priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>         if (!priv)
> @@ -1816,16 +1884,31 @@ static int lwmi_other_probe(struct wmi_device *wdev, const void *context)
>         priv->wdev = wdev;
>         dev_set_drvdata(&wdev->dev, priv);
>
> +       ret = component_add(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +       if (ret)
> +               return ret;
> +
>         lwmi_cd_match_add_all(&wdev->dev, &master_match);
> -       if (IS_ERR(master_match))
> -               return PTR_ERR(master_match);
> +       if (IS_ERR(master_match)) {
> +               ret = PTR_ERR(master_match);
> +               goto err_component;
> +       }
> +
> +       ret = component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
> +                                             master_match);
> +       if (ret)
> +               goto err_component;
> +
> +       return 0;
>
> -       return component_master_add_with_match(&wdev->dev, &lwmi_om_master_ops,
> -                                              master_match);
> +err_component:
> +       component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
> +       return ret;
>  }
>
>  static void lwmi_other_remove(struct wmi_device *wdev)
>  {
> +       component_del(&wdev->dev, &lwmi_om_fan_method_component_ops);
>         component_master_del(&wdev->dev, &lwmi_om_master_ops);
>  }

You may reference the following commit and the 4-5 preceding ones to
see if they help you:
https://github.com/anatase-org/patchwork/commit/71925109610c9753504ab43b3a09aa60058f8829

Specifically, this is my version to your patch:
https://github.com/anatase-org/patchwork/commit/718c90474b89b3e931af9255c00c8e4c76ddf32e

Perhaps it is a bit more straightforward.

>
> --
> 2.55.0
>
