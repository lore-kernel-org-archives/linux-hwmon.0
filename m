Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D673DC433E0
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Jan 2021 22:50:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB07E221E7
	for <linux-hwmon@archiver.kernel.org>; Mon, 25 Jan 2021 22:50:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732512AbhAYWuj (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 25 Jan 2021 17:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732386AbhAYWub (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 25 Jan 2021 17:50:31 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B7F3C061573
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Jan 2021 14:49:48 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id d13so30000163ioy.4
        for <linux-hwmon@vger.kernel.org>; Mon, 25 Jan 2021 14:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BAPV9nMILiyCkX4UGLofOP88dR7ClvmU7eXKfjr7Q0k=;
        b=Wv8n8yXMSnDHtaXErc/F6kUbz0yUn1vwxgWzXdWXUfs36V2K9bxWHl9s41QGd8rD2P
         vbWq+stprqR6jAARRzSq5uYgEStAjb1wZOQTmsv7dHS28YJKVjtP6poaEnqdCuABCwN/
         gpQm+ksn86AEm+Lp30NqSLCeWB/bH0rg+kVHT2av+ddmmXK472gDvTSR+0Lii/6VmvFV
         sMQYz9et4oQkCAv+bNvof4pZKiuAl/UxzJRv3GsaMvLjsYJcvNMACp508RayABkVpLD6
         yc156CTqJ9bbVMqc7v6MvnFf/Q84k9fpxr5Dv+05CtuVdDeP0OQ7Dz0SikKi6eZiqmKF
         YJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BAPV9nMILiyCkX4UGLofOP88dR7ClvmU7eXKfjr7Q0k=;
        b=K0sK4oF7Dfn+RyeNGp1EgJj82XG5QL7sTc1+CFttaO9aofkDLI/wcQDl5+f5+NJsBl
         GUuvLWE1EDr6+ET6xqk+Iw7l9MxRu4SZJSYWDrpX6q4uxyk1t+clP7GLBi2RQZhW0T/A
         l0zc223962cP0o/qabe/X9C+W1sywE9ye63tE0oSlP0/6KBb1fyOd6+I2SAdcsfLWl+k
         K2bzpazZ34zp2KXNZQFibrmHZUXJZDAg81NctymAIt8rDTgUAPp7yc91GavRlkegtkpr
         a1eotTWHgC1yFpnb8F49uzPBvQ6zpkN0BLGKdUZjO2gsRaLPNgwCk+vRioFDOMhWUnCE
         CGFg==
X-Gm-Message-State: AOAM533iiWc2gSq1aA7O/RL26OMF2AQOwEiTgVYq4/mjsshc2ZOOo0XZ
        wQkCcPz+NfzZqRxzXut5T6BVLCR2L5PCQ4a45370kw==
X-Google-Smtp-Source: ABdhPJxIxE/Ps6ZDz2F3uM/Fsk1saSp28KCyBGODPp7jTrOotyAthEpIIWK7ljb935HYcb4xAyFEWO9pSuKkzwOuhso=
X-Received: by 2002:a92:ab12:: with SMTP id v18mr2190961ilh.290.1611614985972;
 Mon, 25 Jan 2021 14:49:45 -0800 (PST)
MIME-Version: 1.0
References: <20210125185327.93282-1-linux@roeck-us.net>
In-Reply-To: <20210125185327.93282-1-linux@roeck-us.net>
From:   Alex Qiu <xqiu@google.com>
Date:   Mon, 25 Jan 2021 14:49:35 -0800
Message-ID: <CAA_a9xK1RjxAXu1LTzUQaiWH45eyHgKPhQZn7bghZT8nOA5aAQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (pmbus/max16601) Determine and use number of
 populated phases
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Ugur Usug <Ugur.Usug@maximintegrated.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Nit: Would it be better to specify what P and N mean upfront in the doc?

- Alex Qiu

On Mon, Jan 25, 2021 at 10:53 AM Guenter Roeck <linux@roeck-us.net> wrote:
>
> The MAX16601 can report the number of populated phases. Use this
> information to only create sysfs attributes for populated phases.
>
> Cc: Alex Qiu <xqiu@google.com>
> Cc: Ugur Usug <Ugur.Usug@maximintegrated.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Alex Qiu <xqiu@google.com>
> ---
>  Documentation/hwmon/max16601.rst | 98 ++++++++++----------------------
>  drivers/hwmon/pmbus/max16601.c   | 17 +++++-
>  2 files changed, 45 insertions(+), 70 deletions(-)
>
> diff --git a/Documentation/hwmon/max16601.rst b/Documentation/hwmon/max16601.rst
> index 346e74674c51..93d25dfa028e 100644
> --- a/Documentation/hwmon/max16601.rst
> +++ b/Documentation/hwmon/max16601.rst
> @@ -60,75 +60,35 @@ curr1_input         VCORE input current, derived from duty cycle and output
>  curr1_max              Maximum input current.
>  curr1_max_alarm                Current high alarm.
>
> -curr2_label            "iin1.0"
> -curr2_input            VCORE phase 0 input current.
> -
> -curr3_label            "iin1.1"
> -curr3_input            VCORE phase 1 input current.
> -
> -curr4_label            "iin1.2"
> -curr4_input            VCORE phase 2 input current.
> -
> -curr5_label            "iin1.3"
> -curr5_input            VCORE phase 3 input current.
> -
> -curr6_label            "iin1.4"
> -curr6_input            VCORE phase 4 input current.
> -
> -curr7_label            "iin1.5"
> -curr7_input            VCORE phase 5 input current.
> -
> -curr8_label            "iin1.6"
> -curr8_input            VCORE phase 6 input current.
> -
> -curr9_label            "iin1.7"
> -curr9_input            VCORE phase 7 input current.
> -
> -curr10_label           "iin2"
> -curr10_input           VCORE input current, derived from sensor element.
> -
> -curr11_label           "iin3"
> -curr11_input           VSA input current.
> -
> -curr12_label           "iout1"
> -curr12_input           VCORE output current.
> -curr12_crit            Critical output current.
> -curr12_crit_alarm      Output current critical alarm.
> -curr12_max             Maximum output current.
> -curr12_max_alarm       Output current high alarm.
> -
> -curr13_label           "iout1.0"
> -curr13_input           VCORE phase 0 output current.
> -
> -curr14_label           "iout1.1"
> -curr14_input           VCORE phase 1 output current.
> -
> -curr15_label           "iout1.2"
> -curr15_input           VCORE phase 2 output current.
> -
> -curr16_label           "iout1.3"
> -curr16_input           VCORE phase 3 output current.
> -
> -curr17_label           "iout1.4"
> -curr17_input           VCORE phase 4 output current.
> -
> -curr18_label           "iout1.5"
> -curr18_input           VCORE phase 5 output current.
> -
> -curr19_label           "iout1.6"
> -curr19_input           VCORE phase 6 output current.
> -
> -curr20_label           "iout1.7"
> -curr20_input           VCORE phase 7 output current.
> -
> -curr21_label           "iout3"
> -curr21_input           VSA output current.
> -curr21_highest         Historical maximum VSA output current.
> -curr21_reset_history   Write any value to reset curr21_highest.
> -curr21_crit            Critical output current.
> -curr21_crit_alarm      Output current critical alarm.
> -curr21_max             Maximum output current.
> -curr21_max_alarm       Output current high alarm.
> +curr[P+2]_label                "iin1.P"
> +curr[P+2]_input                VCORE phase P input current.
> +
> +curr[N+2]_label                "iin2"
> +curr[N+2]_input                VCORE input current, derived from sensor element.
> +                       'N' is the number of enabled/populated phases.
> +
> +curr[N+3]_label                "iin3"
> +curr[N+3]_input                VSA input current.
> +
> +curr[N+4]_label                "iout1"
> +curr[N+4]_input                VCORE output current.
> +curr[N+4]_crit         Critical output current.
> +curr[N+4]_crit_alarm   Output current critical alarm.
> +curr[N+4]_max          Maximum output current.
> +curr[N+4]_max_alarm    Output current high alarm.
> +
> +curr[N+P+5]_label      "iout1.P"
> +curr[N+P+5]_input      VCORE phase P output current.
> +
> +curr[2*N+5]_label      "iout3"
> +curr[2*N+5]_input      VSA output current.
> +curr[2*N+5]_highest    Historical maximum VSA output current.
> +curr[2*N+5]_reset_history
> +                       Write any value to reset curr21_highest.
> +curr[2*N+5]_crit       Critical output current.
> +curr[2*N+5]_crit_alarm Output current critical alarm.
> +curr[2*N+5]_max                Maximum output current.
> +curr[2*N+5]_max_alarm  Output current high alarm.
>
>  power1_label           "pin1"
>  power1_input           Input power, derived from duty cycle and output current.
> diff --git a/drivers/hwmon/pmbus/max16601.c b/drivers/hwmon/pmbus/max16601.c
> index a960b86e72d2..efe6da3bc8d0 100644
> --- a/drivers/hwmon/pmbus/max16601.c
> +++ b/drivers/hwmon/pmbus/max16601.c
> @@ -31,6 +31,7 @@
>
>  #include "pmbus.h"
>
> +#define REG_DEFAULT_NUM_POP    0xc4
>  #define REG_SETPT_DVID         0xd1
>  #define  DAC_10MV_MODE         BIT(4)
>  #define REG_IOUT_AVG_PK                0xee
> @@ -40,6 +41,8 @@
>  #define  CORE_RAIL_INDICATOR   BIT(7)
>  #define REG_PHASE_REPORTING    0xf4
>
> +#define MAX16601_NUM_PHASES    8
> +
>  struct max16601_data {
>         struct pmbus_driver_info info;
>         struct i2c_client *vsa;
> @@ -195,6 +198,18 @@ static int max16601_identify(struct i2c_client *client,
>         else
>                 info->vrm_version[0] = vr12;
>
> +       reg = i2c_smbus_read_byte_data(client, REG_DEFAULT_NUM_POP);
> +       if (reg < 0)
> +               return reg;
> +
> +       /*
> +        * If REG_DEFAULT_NUM_POP returns 0, we don't know how many phases
> +        * are populated. Stick with the default in that case.
> +        */
> +       reg &= 0x0f;
> +       if (reg && reg <= MAX16601_NUM_PHASES)
> +               info->phases[0] = reg;
> +
>         return 0;
>  }
>
> @@ -216,7 +231,7 @@ static struct pmbus_driver_info max16601_info = {
>         .func[2] = PMBUS_HAVE_IIN | PMBUS_HAVE_STATUS_INPUT |
>                 PMBUS_HAVE_IOUT | PMBUS_HAVE_STATUS_IOUT |
>                 PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP | PMBUS_PAGE_VIRTUAL,
> -       .phases[0] = 8,
> +       .phases[0] = MAX16601_NUM_PHASES,
>         .pfunc[0] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
>         .pfunc[1] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT,
>         .pfunc[2] = PMBUS_HAVE_IIN | PMBUS_HAVE_IOUT | PMBUS_HAVE_TEMP,
> --
> 2.17.1
>
