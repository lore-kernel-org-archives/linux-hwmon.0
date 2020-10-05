Return-Path: <SRS0=kkoh=DM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C790C4727D
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 07:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 051B12075A
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 07:50:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NZZRP2Q9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725896AbgJEHuY (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Oct 2020 03:50:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725870AbgJEHuX (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Oct 2020 03:50:23 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71C7AC0613CE
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2020 00:50:23 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id j136so7718712wmj.2
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2020 00:50:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :content-transfer-encoding;
        bh=/gNj5RGizFaiiX2S3nxX8Wjw/l9Zgq8hCxi5a/wrkhA=;
        b=NZZRP2Q9Vnk03IPJguHkPvULnE5H6N4nn4h9m0VhNUnZLc44pqN/imE78DLESrf+ie
         vMylgRVn12J1MIrn1M00gX9o4dEUXwVKDiQ/t6GpvdQ1Us10xJpt/zyA6jaxkny2MqUl
         xwxgsSnb8Atm2aX3GaZrZBV9aQHYaiAKnaK8PN+mw6bWD966iLUxmUQuqpvLDNeoICJ1
         d/bOHkPsJ36HZnZ+K1wQSxsImSRnUzUY/GtU5byDhPjilvuBjSyjFxpl9qtN/vxAetKr
         X4znqrRceZ/Lmiyte+oE2Ho8jhwB1sfx1wu5fZHQZigxAqqvIjcZmHbJUgOqhPbugXDH
         uewA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition:content-transfer-encoding;
        bh=/gNj5RGizFaiiX2S3nxX8Wjw/l9Zgq8hCxi5a/wrkhA=;
        b=epZZ/bPxAV1ohTlzYng4dFOGNW8+V4QyicvxmL28QdD63rir/RdCs6CI669HPFErlq
         7q4icu67amd44WvchAuN0YrhYiOyCOVzo4X6OC/+YblgpyV4IYnTVKGRQjUUKlo+ZAam
         2msxKdlBcrsRY9qxOCAEij8sOSS6mxPpI38rnMQukejlT/Njnk+kWcTLjTuQ/m3eiVc/
         BZzDX/FsMWpEpNWyDtGbgpbnEnxlZN7eyZWZVTwFF42jxtUg9OYkPSP2zFn5Yt8UXNac
         UAd8r5ryO8pi5gacKyww4uDpDzJXHjtEPn9Hc4zXptAEJc8/HSPTCGcJIEU8Pwvtj+8f
         9SZQ==
X-Gm-Message-State: AOAM5333hxwvIBr+mY3kF97WtKC10BS7wfAWbgmm/gnLHdOAISD1+M0U
        stqW4L9lUmoqwpPgy5E2oYHkBQGoaqY=
X-Google-Smtp-Source: ABdhPJw595c/LdFAn2Y4o+ewsx0Qc5YxM0FRM8BL2i3hvhMOrmwBjiXXOkZyEQHKFqmNy9FVJsKXCQ==
X-Received: by 2002:a1c:117:: with SMTP id 23mr15312732wmb.48.1601884221742;
        Mon, 05 Oct 2020 00:50:21 -0700 (PDT)
Received: from Red ([2a01:cb1d:3d5:a100:264b:feff:fe03:2806])
        by smtp.googlemail.com with ESMTPSA id t6sm13090952wre.30.2020.10.05.00.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 00:50:20 -0700 (PDT)
Date:   Mon, 5 Oct 2020 09:50:19 +0200
From:   Corentin Labbe <clabbe.montjoie@gmail.com>
To:     linux-hwmon@vger.kernel.org, linux@roeck-us.net, jdelvare@suse.com
Subject: hwmon: nct6775: If an ACPI driver is available for this device, you
 should use it instead of the native driver
Message-ID: <20201005075019.GA29306@Red>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hello

I have a motherboard with a nct6775 and I got this on boot:
nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20200326/utaddress-204)
ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
And so the driver is not loaded.

Since I dont have an ACPI driver for it I have hacked the driver to skip this acpi_check_resource_conflict() and the driver works well:
nct6798-isa-0290
Adapter: ISA adapter
in0:                   936.00 mV (min =  +0.00 V, max =  +1.74 V)
in1:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in2:                     3.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in3:                     3.33 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in4:                     1.01 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in5:                   776.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in6:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in7:                     3.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in8:                     3.31 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in10:                  272.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in11:                  552.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
in12:                    1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in13:                    1.01 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
in14:                  992.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
fan1:                     0 RPM  (min =    0 RPM)
fan2:                  1138 RPM  (min =    0 RPM)
fan3:                  1744 RPM  (min =    0 RPM)
fan4:                     0 RPM  (min =    0 RPM)
fan5:                  2402 RPM  (min =    0 RPM)
fan6:                     0 RPM  (min =    0 RPM)
fan7:                     0 RPM  (min =    0 RPM)
SYSTIN:                 +38.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
CPUTIN:                 +37.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
AUXTIN0:                +25.0°C    sensor = thermistor
AUXTIN1:                +53.0°C    sensor = thermistor
AUXTIN2:                +20.0°C    sensor = thermistor
AUXTIN3:                +26.0°C    sensor = thermistor
SMBUSMASTER 1:          +61.5°C  
PCH_CHIP_CPU_MAX_TEMP:   +0.0°C  
PCH_CHIP_TEMP:           +0.0°C  
PCH_CPU_TEMP:            +0.0°C  
intrusion0:            ALARM
intrusion1:            ALARM
beep_enable:           disabled

I got the same problem with an it87 and did the same, but does it exists a better way to do this ?
Or does I ignore soemthing to make it works ?

Thanks
Regards
