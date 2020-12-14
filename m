Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 998F4C2BB40
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 22:10:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 336232247F
	for <linux-hwmon@archiver.kernel.org>; Mon, 14 Dec 2020 22:10:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2441066AbgLNWHX (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 14 Dec 2020 17:07:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440196AbgLNWHO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 14 Dec 2020 17:07:14 -0500
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9DFB7C0613D3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 14:06:34 -0800 (PST)
Received: by mail-oi1-x243.google.com with SMTP id p126so20988104oif.7
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Dec 2020 14:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TioJ54MwoOBl3527ANOnyxS74LZ7YJDGg6Bxg5BT6t4=;
        b=ep9LmuoRvelKqFMmJl7zY9YinpnIw3guIE9pqIRfE2Sp8fstB0ilYhT4wEejm49oLF
         h77YBcZnrd+Od29emHIXTPXcqvrRBmXp3NX+MAc8njCtVKsqGXim/0+T0iTSS1DZhJgh
         B0Zfnv2LppP6V6zp84OqynAE/SlsGwIhXw3Ww=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TioJ54MwoOBl3527ANOnyxS74LZ7YJDGg6Bxg5BT6t4=;
        b=YNHSN0URLD6qvqZc6hyF1fNP7vHwVkClBBMRFn+QJ7zj1FEn76oTw+8qyI/ZxsPK8C
         yF3YR/MtLLK0Y+pgkWzOKkMf2TUray3ZxgFu2l279n06YVJPK25LfcTtwJaeBPduzIZJ
         jyS9k+RyHC4Sxn7v7no5GPzAeOijddRqCYYkKOv2FRe4hGDUnJclWhhGVFg4Iw6V5LN4
         aAy0TSuhaIOanNFR8aVNV4C6rABH1SguNs9LxqLWnGnZ9WnObsDpi3a+jZRDwEU9CNqA
         MX4hh8nyhx67JOqqM8w3bXDjOBdyfD5f/YxJEMuy/53f4H/unYEuP+nde0ybgk745vPp
         zpNQ==
X-Gm-Message-State: AOAM532oqUgbO/xeQTrYvXX87pRiuCXm2W1iMVOibnukSlakrUnIjQP4
        lsULfnSNuG4lAN3a29k49sUFJVUCF3jHaje+m36fRw==
X-Google-Smtp-Source: ABdhPJwhzKvE4mBskBLmEgKAxAg0xTWC4IgdCL3u6BqBGHzIi74HQjkpI4J3OWgQv7EJm2JwYPGyc+SXk65dEaPKGBQ=
X-Received: by 2002:aca:bf0b:: with SMTP id p11mr14799853oif.6.1607983593983;
 Mon, 14 Dec 2020 14:06:33 -0800 (PST)
MIME-Version: 1.0
References: <20201214213044.27252-1-linux@roeck-us.net>
In-Reply-To: <20201214213044.27252-1-linux@roeck-us.net>
From:   Paul Barker <pbarker@konsulko.com>
Date:   Mon, 14 Dec 2020 22:06:23 +0000
Message-ID: <CAM9ZRVs3gBoYYQ+M1qUiLpuFTD0c_vxdNgDTXoXisne-Y8ZwQg@mail.gmail.com>
Subject: Re: [GIT PULL] hwmon updates for v5.11
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        linux-hwmon@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Mon, 14 Dec 2020 at 21:32, Guenter Roeck <linux@roeck-us.net> wrote:
>
> Hi Linus,
>
> Please pull hwmon updates for Linux v5.11 from signed tag:
>
>     git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-for-v5.11
>
> Thanks,
> Guenter
> ------
>
> The following changes since commit b65054597872ce3aefbc6a666385eabdf9e288da:
>
>   Linux 5.10-rc6 (2020-11-29 15:50:50 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git tags/hwmon-for-v5.11
>
> for you to fetch changes up to 1a033769a4fe9a86ee791fd553b6a996dd76e026:
>
>   dt-bindings: (hwmon/sbtsi_temp) Add SB-TSI hwmon driver bindings (2020-12-12 08:36:09 -0800)
>
> ----------------------------------------------------------------
> hwmon patches for v5.11
>
> - Driver for SB-TSI sensors
> - Add support for P10 to fsi/occ
> - Driver for LTC2992
> - Driver for Delta power supplies Q54SJ108A2
> - Support for NCT6687D added to nct6883 driver
> - Support for Intel-based Xserves added to applesmc driver
> - Driver for  Maxim MAX127
> - Support for  AMD family 19h model 01h added to amd_energy driver
> - Driver to support Corsair PSU
> - Driver for STMicroelectronics PM6764 Voltage Regulator
> - Various minor bug fixes and improvements
>
> ----------------------------------------------------------------
> Alexandru Tachici (3):
>       hwmon: (ltc2992) Add support
>       hwmon: (ltc2992) Add support for GPIOs.
>       dt-bindings: hwmon: Add documentation for ltc2992
>
> Bartosz Golaszewski (1):
>       hwmon: (pmbus) shrink code and remove pmbus_do_remove()
>
> Charles (1):
>       hwmon: Add driver for STMicroelectronics PM6764 Voltage Regulator
>
> Chris Packham (1):
>       hwmon: (adt7470) Create functions for updating readings and limits
>
> Colin Ian King (2):
>       hwmon: (corsair-psu) fix unintentional sign extension issue
>       hwmon: (ltc2992) Fix less than zero comparisons with an unsigned integer
>
> Corentin Labbe (1):
>       hwmon: drivetemp: fix typo temperatire => temperature
>
> Dan Carpenter (2):
>       hwmon: (acpi_power_meter) clean up freeing code
>       hwmon: (pmbus/max20730) delete some dead code
>
> David Bartley (1):
>       hwmon: (nct6683) Support NCT6687D.
>
> Eddie James (3):
>       dt-bindings: fsi: Add P10 OCC device documentation
>       fsi: occ: Add support for P10
>       hwmon: (occ) Add new temperature sensor type
>
> Geert Uytterhoeven (2):
>       hwmon: (xgene) Drop bogus __refdata annotation
>       hwmon: (iio_hwmon) Drop bogus __refdata annotation
>
> Joe Jamison (1):
>       hwmon: (applesmc) Add DMI product matches for Intel-based Xserves (non-RackMac*)
>
> Krzysztof Kozlowski (4):
>       dt-bindings: hwmon: convert TI INA2xx bindings to dt-schema
>       dt-bindings: hwmon: convert AD AD741x bindings to dt-schema
>       dt-bindings: hwmon: convert TI ADS7828 bindings to dt-schema
>       dt-bindings: hwmon: convert AD ADM1275 bindings to dt-schema
>
> Kun Yi (3):
>       hwmon: (sbtsi) Add basic support for SB-TSI sensors
>       hwmon: (sbtsi) Add documentation
>       dt-bindings: (hwmon/sbtsi_temp) Add SB-TSI hwmon driver bindings
>
> Lee Jones (3):
>       hwmon: (adm1177) Fix kerneldoc attribute formatting
>       hwmon: (ina3221) Demote seemingly unintentional kerneldoc header
>       hwmon: (ibmpowernv) Silence strncpy() warning
>
> Lukas Bulwahn (1):
>       hwmon: (pmbus/q54sj108a2) Correct title underline length
>
> Naveen Krishna Chatradhi (2):
>       hwmon: (amd_energy) Add AMD family 19h model 01h x86 match
>       docs: hwmon: (amd_energy) update documentation
>
> Paul Barker (3):
>       dt-bindings: hwmon: pwm-fan: Support multiple fan tachometer inputs

Should this one go in at this stage? The patches to implement support
for multiple fan tachometer inputs are still outstanding. So the
dt-binding will be left documenting a feature which isn't yet
supported.

>       hwmon: pwm-fan: Refactor pwm_fan_probe
>       hwmon: (pwm-fan) Convert to hwmon_device_register_with_info API
>
> Tao Ren (2):
>       hwmon: (max127) Add Maxim MAX127 hardware monitoring driver
>       docs: hwmon: Document max127 driver
>
> Tian Tao (1):
>       hwmon: (abx500) Switch to using the new API kobj_to_dev()
>
> Wilken Gottwalt (2):
>       hwmon: add Corsair PSU HID controller driver
>       hwmon: (corsair-psu) Fix fan rpm calculation
>
> Zhang Qilong (1):
>       hwmon: (ina3221) Fix PM usage counter unbalance in ina3221_write_enable
>
> xiao.ma (1):
>       hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2
>
>  .../devicetree/bindings/fsi/ibm,p9-occ.txt         |  12 +-
>  Documentation/devicetree/bindings/hwmon/ad741x.txt |  15 -
>  .../devicetree/bindings/hwmon/adi,ad741x.yaml      |  39 +
>  .../devicetree/bindings/hwmon/adi,adm1275.yaml     |  57 ++
>  .../devicetree/bindings/hwmon/adi,ltc2992.yaml     |  80 ++
>  .../devicetree/bindings/hwmon/adm1275.txt          |  25 -
>  .../devicetree/bindings/hwmon/ads7828.txt          |  25 -
>  .../devicetree/bindings/hwmon/amd,sbtsi.yaml       |  54 ++
>  Documentation/devicetree/bindings/hwmon/ina2xx.txt |  24 -
>  .../devicetree/bindings/hwmon/pwm-fan.txt          |  28 +-
>  .../devicetree/bindings/hwmon/ti,ads7828.yaml      |  57 ++
>  .../devicetree/bindings/hwmon/ti,ina2xx.yaml       |  55 ++
>  .../devicetree/bindings/trivial-devices.yaml       |   4 -
>  Documentation/hwmon/adm1275.rst                    |   2 +-
>  Documentation/hwmon/amd_energy.rst                 |   7 +-
>  Documentation/hwmon/corsair-psu.rst                |  82 ++
>  Documentation/hwmon/index.rst                      |   6 +
>  Documentation/hwmon/ltc2992.rst                    |  56 ++
>  Documentation/hwmon/max127.rst                     |  45 +
>  Documentation/hwmon/nct6683.rst                    |   3 +-
>  Documentation/hwmon/pm6764tr.rst                   |  32 +
>  Documentation/hwmon/pmbus-core.rst                 |   6 -
>  Documentation/hwmon/pmbus.rst                      |   6 -
>  Documentation/hwmon/q54sj108a2.rst                 |  54 ++
>  Documentation/hwmon/sbtsi_temp.rst                 |  42 +
>  MAINTAINERS                                        |  16 +-
>  drivers/fsi/fsi-occ.c                              | 125 ++-
>  drivers/hwmon/Kconfig                              |  44 +
>  drivers/hwmon/Makefile                             |   4 +
>  drivers/hwmon/abx500.c                             |   2 +-
>  drivers/hwmon/acpi_power_meter.c                   |   9 +-
>  drivers/hwmon/adm1177.c                            |  10 +-
>  drivers/hwmon/adt7470.c                            | 154 +++-
>  drivers/hwmon/amd_energy.c                         |   1 +
>  drivers/hwmon/applesmc.c                           |   4 +
>  drivers/hwmon/corsair-psu.c                        | 600 +++++++++++++
>  drivers/hwmon/drivetemp.c                          |   2 +-
>  drivers/hwmon/ibmpowernv.c                         |   2 +-
>  drivers/hwmon/iio_hwmon.c                          |   2 +-
>  drivers/hwmon/ina3221.c                            |   4 +-
>  drivers/hwmon/ltc2992.c                            | 971 +++++++++++++++++++++
>  drivers/hwmon/max127.c                             | 352 ++++++++
>  drivers/hwmon/nct6683.c                            |  14 +-
>  drivers/hwmon/occ/common.c                         |  75 ++
>  drivers/hwmon/pmbus/Kconfig                        |  18 +
>  drivers/hwmon/pmbus/Makefile                       |   2 +
>  drivers/hwmon/pmbus/adm1266.c                      |   1 -
>  drivers/hwmon/pmbus/adm1275.c                      |   1 -
>  drivers/hwmon/pmbus/bel-pfe.c                      |   1 -
>  drivers/hwmon/pmbus/ibm-cffps.c                    |   1 -
>  drivers/hwmon/pmbus/inspur-ipsps.c                 |   1 -
>  drivers/hwmon/pmbus/ir35221.c                      |   1 -
>  drivers/hwmon/pmbus/ir38064.c                      |   1 -
>  drivers/hwmon/pmbus/irps5401.c                     |   1 -
>  drivers/hwmon/pmbus/isl68137.c                     |   1 -
>  drivers/hwmon/pmbus/lm25066.c                      |   1 -
>  drivers/hwmon/pmbus/ltc2978.c                      |   1 -
>  drivers/hwmon/pmbus/ltc3815.c                      |   1 -
>  drivers/hwmon/pmbus/max16064.c                     |   1 -
>  drivers/hwmon/pmbus/max16601.c                     |   1 -
>  drivers/hwmon/pmbus/max20730.c                     |   3 -
>  drivers/hwmon/pmbus/max20751.c                     |   1 -
>  drivers/hwmon/pmbus/max31785.c                     |   1 -
>  drivers/hwmon/pmbus/max34440.c                     |   1 -
>  drivers/hwmon/pmbus/max8688.c                      |   1 -
>  drivers/hwmon/pmbus/mp2975.c                       |   1 -
>  drivers/hwmon/pmbus/pm6764tr.c                     |  75 ++
>  drivers/hwmon/pmbus/pmbus.c                        |   1 -
>  drivers/hwmon/pmbus/pmbus.h                        |   1 -
>  drivers/hwmon/pmbus/pmbus_core.c                   |  20 +-
>  drivers/hwmon/pmbus/pxe1610.c                      |   1 -
>  drivers/hwmon/pmbus/q54sj108a2.c                   | 422 +++++++++
>  drivers/hwmon/pmbus/tps40422.c                     |   1 -
>  drivers/hwmon/pmbus/tps53679.c                     |   1 -
>  drivers/hwmon/pmbus/ucd9000.c                      |   1 -
>  drivers/hwmon/pmbus/ucd9200.c                      |   1 -
>  drivers/hwmon/pmbus/xdpe12284.c                    |   1 -
>  drivers/hwmon/pmbus/zl6100.c                       |   1 -
>  drivers/hwmon/pwm-fan.c                            | 164 ++--
>  drivers/hwmon/sbtsi_temp.c                         | 250 ++++++
>  drivers/hwmon/xgene-hwmon.c                        |   2 +-
>  81 files changed, 3875 insertions(+), 316 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ad741x.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ad741x.yaml
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,adm1275.yaml
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adi,ltc2992.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ads7828.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/amd,sbtsi.yaml
>  delete mode 100644 Documentation/devicetree/bindings/hwmon/ina2xx.txt
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ads7828.yaml
>  create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina2xx.yaml
>  create mode 100644 Documentation/hwmon/corsair-psu.rst
>  create mode 100644 Documentation/hwmon/ltc2992.rst
>  create mode 100644 Documentation/hwmon/max127.rst
>  create mode 100644 Documentation/hwmon/pm6764tr.rst
>  create mode 100644 Documentation/hwmon/q54sj108a2.rst
>  create mode 100644 Documentation/hwmon/sbtsi_temp.rst
>  create mode 100644 drivers/hwmon/corsair-psu.c
>  create mode 100644 drivers/hwmon/ltc2992.c
>  create mode 100644 drivers/hwmon/max127.c
>  create mode 100644 drivers/hwmon/pmbus/pm6764tr.c
>  create mode 100644 drivers/hwmon/pmbus/q54sj108a2.c
>  create mode 100644 drivers/hwmon/sbtsi_temp.c



-- 
Paul Barker
Konsulko Group
