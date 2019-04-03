Return-Path: <SRS0=jSl0=SF=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1463C4360F
	for <linux-hwmon@archiver.kernel.org>; Wed,  3 Apr 2019 03:23:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7747C2146E
	for <linux-hwmon@archiver.kernel.org>; Wed,  3 Apr 2019 03:23:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H9Kf+5UF"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726425AbfDCDXI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 2 Apr 2019 23:23:08 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:35496 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726411AbfDCDXI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Apr 2019 23:23:08 -0400
Received: by mail-pf1-f196.google.com with SMTP id t21so7412474pfe.2
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Apr 2019 20:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:openpgp:cc:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=Y5ge1ZjQf8SimZV+7qeZtcyWlnSgvmpT0soqRQJ55g4=;
        b=H9Kf+5UFn7LA1NF/7etL+9NSFnYQkAIxBPttG0QJfr4QFDPaPVp+Zc5t5d6hSSugdh
         2ezrPXXvy/U8xpsoACOU/agFIBolpSvHvvROlA7KlVrL3TErHHWCVZSYJhUj/xvaC5qV
         rA9GxVtdAQJtgRWYAFLDi0dXKg035esTYEXINxRwYvdglxVozmbRX9bryJ/hG8dGI1aV
         y+rH5QDkeQVp+5PHU5RepPFj4GOZdKLW4Cq9XGn4Yg54dwGsWWxA2wwvUkgiBlgKD8vp
         hAr17OSMzycTf0tYExokvz8s5i4UMuA59o03FWL/fQ+nhFSolNHchVGob4IMINwEsVQI
         yPiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:openpgp:cc:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=Y5ge1ZjQf8SimZV+7qeZtcyWlnSgvmpT0soqRQJ55g4=;
        b=PsBeY4QEp7VFXsxDzypUZReFGem7aEPqKMYoOnrzl/tF6uS8jKgNMbjHrmkLkoU0E9
         CUsNUds64g1fcE34A8IdChiNFP2yrxi/ubcO1H6xjb1GVVIXDYyjZ9P3/2KZnK0hqZe0
         kQh4sbJexhy7FKnc1jYlShRBmHByy6CXjY/qhj+HCn+rOT3BcYIegrS8r5VpVgi0Gqd4
         FinTqt0vuNJJ2ilpomm24NhvpQZGmAJxTRPRUHCisRhgl97bnewkzaNwII30uHupxWeo
         /CQDZEAnNFXy5feVCxCBkR5Oh3FzkSlwXE7Y69ZIELKt01qPCL86jq5dAzg9qaEmhLaL
         EwnQ==
X-Gm-Message-State: APjAAAUTjiGKFBFpAYMx+LHCL8sEe8Z16yoKWwsPfsgJegEWBNrQGJRn
        7AWeHZjXctPC+cUgELQxQPc=
X-Google-Smtp-Source: APXvYqzEluOStjzEgaV8YApmSvefAXKFlZgW9r1ujFeJQY+7yATMkd+csZ4bvKuyhdOeDpS5d3V2MA==
X-Received: by 2002:a62:204b:: with SMTP id g72mr67036332pfg.51.1554261787008;
        Tue, 02 Apr 2019 20:23:07 -0700 (PDT)
Received: from [10.230.28.107] ([192.19.223.250])
        by smtp.gmail.com with ESMTPSA id n1sm16755597pgv.19.2019.04.02.20.23.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 02 Apr 2019 20:23:06 -0700 (PDT)
To:     Sudeep Holla <sudeep.holla@arm.com>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>, linux-hwmon@vger.kernel.org
From:   Florian Fainelli <f.fainelli@gmail.com>
Subject: Couple of questions on SCMI sensor protocol and Linux implementation
Openpgp: preference=signencrypt
Cc:     Guenter Roeck <linux@roeck-us.net>
Message-ID: <1902f151-7ddd-6b4b-4135-a2affe20c009@gmail.com>
Date:   Tue, 2 Apr 2019 20:22:58 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

Hi Sudeep,

There are a couple of things on which I would appreciate your feedback
regarding the Linux SCMI sensor protocol:

1) The Linux SCMI implementation has all the nuts and bolts to allow
configuring trip points, but the hwmon subsystem through the use of
hwmon_thermal_add_sensor() API does not actually make use of that
capability. Would it be a big stretch to use the hwmon_ops::write
function to get to support that feature? The other thing that puzzles me
is that there does not appear to be provision in the SCMI sensor
protocol to describe thermal zones, so I assume that people still have
to provide supplemental data through Device Tree for
devm_thermal_zone_of_sensor_register() to pick up the thermal zones
definitions?

2) Support for regulators through SCMI

I work with a device where the regulators can only be controlled via a
dedicated piece of HW which is accessible through SCMI from the Linux
side. Do you think there is value in coming up with a scmi-regulator.c
driver that makes use of the sensor protocol for discovering and
reporting regulators or would that be something that belongs more to the
power domain protocol?

Thanks for reading me! Cheers
-- 
Florian
