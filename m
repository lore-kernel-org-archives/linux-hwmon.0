Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D112EC2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 05:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A8DF206CB
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 05:50:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="uqd9ya84"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726009AbfLXFuI (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 00:50:08 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54397 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725966AbfLXFuI (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 00:50:08 -0500
Received: by mail-pj1-f65.google.com with SMTP id kx11so745506pjb.4
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Dec 2019 21:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v1jgN2vFzUXVrwJDAHzgGbzvDMvHus4TEC6h2oX2GrY=;
        b=uqd9ya84J7LLKVf8JeVCVK/5RuxwTWcaibK2KGFy9Awj7ehvTf+CTYWd1clU0JLwnr
         qhCspb9nRH+BWFi9XT4SZsMLhwma093vusfJ9cen4TLkSYBxLtpvIStIKWM2bteBCeMH
         9/zwTwPLOydQtYluEKG5Z6d+lWEselrSGAGubLzv2Ital8V0BVULUr19+ITlTuFpxIdh
         TV1MS0EnZ1kVZufCm9YwnDzA0ljL9+coju0e2TFYnQeobmdU2D500m7aRd6WSTLdBWuo
         lolgGRKRLg/ybxsuiL8eNFcikldogdy3JdDXbh/31G9R3d/4P8BQqbs54LXkH9ngrYnZ
         ULSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=v1jgN2vFzUXVrwJDAHzgGbzvDMvHus4TEC6h2oX2GrY=;
        b=kYh5u7k+8lJTk+6qhuhqGxz3l+kb4wAJguEM+JOSDfsGuIxzC8wTeZVRL3mbWg5XnL
         +ix9QWJi+leMGJ8n//67WoakZXMlLeeMsGLn2gGjMrppMh5niVRLux0uAfTkY5fhjPpU
         qsNlEvLEphgBCNcJobsZRkocdi7YUHLkl36Kj3FOcQmse8r8mkPuH1GrChjhp98K7n33
         htPER+BXSxaCSl4/sPoMY28Kodip2oOrESyboW4DPkmiwYZlRVJAJ9bwyrqL82DyRDh6
         NGBoECoAFt1Xqw74MzJloIPZTVGeZ/cdPnnSePItKN5W5VDXxePJerP8rkewy7gtRqat
         cN+A==
X-Gm-Message-State: APjAAAXzxagZzBjTsbGBp+K7p9Bo8WdFhq6PBu2qfX1QDrNLBVQr6ndm
        1ITVoOqmc00EeJ+AD8nK1L7TewtZ
X-Google-Smtp-Source: APXvYqzAyYoLDJpQvc4kC7/whpqb6x1JF0zVQNk9CrGPxfjlY3zb1RgCkf9o/aVcuI4OqBMVGu7O3A==
X-Received: by 2002:a17:90b:438e:: with SMTP id in14mr3622864pjb.83.1577166607072;
        Mon, 23 Dec 2019 21:50:07 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id k3sm24972164pgc.3.2019.12.23.21.50.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Dec 2019 21:50:06 -0800 (PST)
Reply-To: pgnet.dev@gmail.com
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
From:   PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
Date:   Mon, 23 Dec 2019 21:50:05 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

hi,

On 12/23/19 9:28 PM, Guenter Roeck wrote:
> In the specific issue referenced above, it appears that a Nuvoton NCT6796D
> was detected but not instantiated. Most likely the problem is that the IO address
> range necessary to access the chip is reserved by the BIOS. Looking into the
> kernel log would reveal that information. Again, that has nothing to do with
> support for the CPU installed on the board, but with the board vendor and,
> to a substantial degree, the lack of support for Linux by that board vendor.

not sure if this is of note,

 superiotool --dump
  superiotool r
  No Super I/O found

I've contacted Asus tech re: BIOS 'gotchas' that might be interfering; I'll pass on your comments.  So far, on other issues, they've been very cooperative/helpful; we'll see how this goes.

As for the kernel log, anything specific to look for, share here?  Or just grab & post the whole thing somewhere?

> If you think something is missing that should be displayed by k10temp,
> if you have documentation from AMD describing the necessary registers to
> obtain this information, and if you have permission from AMD to publish
> it, please feel free to submit a patch adding it to the k10temp driver.
> Please make sure that the additional information follows the hardware
> monitoring ABI (specifically, CPU frequencies are not part of that ABI).

Not entirely sure on the 'should' of it ... yet.

I _can_ say that, currently, for the 'new' setup, the limited info with 'k10temp' is

(1) ASUSTeK PRIME X570-PRO mobo + Ryzen7 3700X

	sensors
		k10temp-pci-00c3
		Adapter: PCI adapter
		Tdie:         +59.9°C  (high = +70.0°C)
		Tctl:         +59.9°C


and for an older board/cpu, also with 'k10temp', it's

(2) Asus M3A78-CM with a non-Ryzen, AMD Phenom II

	sensors
		k10temp-pci-00c3
		Adapter: PCI adapter
		temp1:        +42.9°C  (high = +70.0°C)
		                       (crit = +99.5°C, hyst = +97.5°C)

		atk0110-acpi-0
		Adapter: ACPI interface
		Vcore Voltage:       1.02 V  (min =  +0.85 V, max =  +1.60 V)
		 +3.3 Voltage:       3.23 V  (min =  +2.97 V, max =  +3.63 V)
		 +5 Voltage:         4.86 V  (min =  +4.50 V, max =  +5.50 V)
		 +12 Voltage:       12.04 V  (min = +10.20 V, max = +13.80 V)
		CPU FAN Speed:     2789 RPM  (min =  600 RPM, max = 7200 RPM)
		CHASSIS FAN Speed:    0 RPM  (min =  600 RPM, max = 7200 RPM)
		POWER FAN Speed:      0 RPM  (min =  600 RPM, max = 7200 RPM)
		CPU Temperature:    +44.0°C  (high = +60.0°C, crit = +95.0°C)
		MB Temperature:     +34.0°C  (high = +45.0°C, crit = +95.0°C)
