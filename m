Return-Path: <SRS0=lH8M=2O=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4AEBC2D0CF
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 17:15:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F19020706
	for <linux-hwmon@archiver.kernel.org>; Tue, 24 Dec 2019 17:15:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XJ/ybYhy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbfLXRPD (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Tue, 24 Dec 2019 12:15:03 -0500
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35870 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726178AbfLXRPC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 24 Dec 2019 12:15:02 -0500
Received: by mail-pl1-f196.google.com with SMTP id a6so7927514plm.3
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Dec 2019 09:15:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JjRN4IK0u+P3unLyyH0YjjWiMomYmMt3hrvomscfY+Y=;
        b=XJ/ybYhyNkZKnAgYuBeZkknXePOSMr2ipClwF58KL2iWUI/o9iRF9YZ3Vz0d4eqRWr
         16ARbT1azjupzbpANgf/2nIo1AeDnv/qRFvbXcvRf0DUv9qm0It9mvqrbiw4H7ZINOQ1
         Dg8a/ZlwuJ6/KAfJ6pmS+ZL9n162DzrezNS/zOaaFWTOOf8oY4jhh3gjUbgwlvanHYeC
         c7E2DG85/AiUPNun4+CvSCZD7N6l5/z6AunJ/7RWggsbELevORPHohqMTXzNFRdkDSyS
         M8sXBxKUfWkURLbO7xTlVOg9oxjsEB91UV5J+mAt5+BDmDuz6Y5VCs4CDkK8PxKeURTq
         mHLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=JjRN4IK0u+P3unLyyH0YjjWiMomYmMt3hrvomscfY+Y=;
        b=J3n2pn9yWBGvGl5ziaXg/7aSCGYyBlA0TtynD5f5AbKT2ogmnO/eexi9GFuKrk5QsI
         o9dOgBdrG7vqdR7GeKUZSZ4HtG2N8pAw5zZw/wcu1y7p2z1ozNZNdDSPI8jO6p359glG
         xkRbaCRdTDHKdFymlP/iilBV9vBjkhcJ4SCl5ZsxQJk99KrBB0DWbN6UbjIkAxrHCsqA
         LWBIh2QX2QgvEHHlSpC5NxqPCVCkYdGbhn4WIH2RuMB/u0nhoEjllzWEnaB0uKIIipTL
         nd4GPj2oyt01FEerob61kpbLfNi8DSHUZkpuyED3Rshfe99kFc39ZBZOfJ5RrCPdHygb
         W90w==
X-Gm-Message-State: APjAAAUjRNHPY+ni3mxRjiOuuzUfnh9lZg2XbOQq8xiuKxWj9nW5LhhI
        ngzwEq6+x/VTbgtAaa5fE8o=
X-Google-Smtp-Source: APXvYqw6evXGZh0ZQzzUxoYeBvmpX3ZsHnhd17pQ2yiH59CY0qj+PoWxM+mW/vm9e3rnofzTaPaNlA==
X-Received: by 2002:a17:90a:660b:: with SMTP id l11mr7080927pjj.47.1577207701712;
        Tue, 24 Dec 2019 09:15:01 -0800 (PST)
Received: from mua.localhost (99-7-172-215.lightspeed.snmtca.sbcglobal.net. [99.7.172.215])
        by smtp.gmail.com with ESMTPSA id m128sm29139209pfm.183.2019.12.24.09.15.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Dec 2019 09:15:01 -0800 (PST)
Reply-To: pgnet.dev@gmail.com
Subject: Re: kernel 5.4.6 + Ryzen 3700X: "Can't display frequency and others
 of Ryzen7 3700X"
To:     Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Cc:     marcel.p.bocu@gmail.com
References: <bb629ef6-a669-8849-17f4-481c8c9f9347@gmail.com>
 <b2f72e65-4a80-0aaf-ce7e-0880fdcf60c7@roeck-us.net>
 <2c858787-1e5e-77e4-30ef-f17036b205c2@gmail.com>
 <121bee85-6369-4b32-2504-c1d104ea2bd6@roeck-us.net>
 <4a1e2dc9-3303-8dd5-7bbd-3605a43bffe1@gmail.com>
 <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
From:   PGNet Dev <pgnet.dev@gmail.com>
Message-ID: <bf771959-f19b-1abb-7d94-bb5f65c68952@gmail.com>
Date:   Tue, 24 Dec 2019 09:14:59 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <34008d92-9709-786e-5c76-007edffe0a7c@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 12/24/19 8:29 AM, Guenter Roeck wrote:
> The problem is - most likely - that the BIOS (or, rather, ACPI) accesses the
> same memory range, and there is no synchronization. You could try to boot with
> "acpi_enforce_resources=lax" command line option, but that would be on your
> own risk, and some recent boards don't even boot if that command line option
> is present.
> 
> You should not try to load the it87 driver on ASUS boards.
> 
> Did you try to load "asus_atk0110" ?

Had earlier come upon this,

	Nuvoton nct6798d not detected #197
	 https://github.com/lm-sensors/lm-sensors/issues/197

re: the add'n of

	acpi_enforce_resources=lax

and was just adding that to my grub kernel config.

just in case also added,

	cat /etc/modules-load.d/sensors.conf
		msr
		k10temp
		nct6775
+		asus_atk0110

now on reboot, I no longer see those^^ earlier conflict warnings; I _do_ see now,

	...
	[    0.233419] clocksource: acpi_pm: mask: 0xffffff max_cycles: 0xffffff, max_idle_ns: 2085701024 ns
	[    2.484532] ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20190816/utaddress-204)
	[    2.489504] ACPI: This conflict may cause random problems and system instability
	[    2.492038] ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
	[    2.513650] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
	[    2.540469] acpi PNP0C14:02: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9421164 (first instance was on PNP0C14:01)
	[    2.543119] acpi PNP0C14:03: duplicate WMI GUID 05901221-D566-11D1-B2F0-00A0C9421164 (first instance was on PNP0C14:01)
	[    2.559449] ACPI: bus type USB registered
	[   13.553990] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
	[   14.609097] acpi_cpufreq: overriding BIOS provided _PSD data
	[   14.610845] ACPI: Power Button [PWRB]
	[   14.611600] ACPI: Power Button [PWRF]
	[   14.633620] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
	[   15.451860] asus_atk0110: Resources not safely usable due to acpi_enforce_resources kernel parameter
	...

Seems `acpi_enforce_resources` and `asus_atk0110` don't play nicely?

AND, `sensors` certainly appears a bit more informative/useful!

	sensors
		k10temp-pci-00c3
		Adapter: PCI adapter
		Tdie:         +55.2°C  (high = +70.0°C)
		Tctl:         +55.2°C

		nct6798-isa-0290
		Adapter: ISA adapter
		in0:                   504.00 mV (min =  +0.00 V, max =  +1.74 V)
		in1:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in2:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in3:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in4:                   1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in5:                   816.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in6:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in7:                     3.34 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in8:                     3.25 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in9:                   896.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in10:                  408.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in11:                  544.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in12:                    1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
		in13:                  1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		in14:                  1000.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
		fan1:                  1218 RPM  (min =    0 RPM)
		fan2:                  1917 RPM  (min =    0 RPM)
		fan3:                   905 RPM  (min =    0 RPM)
		fan4:                  1190 RPM  (min =    0 RPM)
		fan5:                     0 RPM  (min =    0 RPM)
		fan6:                     0 RPM  (min =    0 RPM)
		fan7:                     0 RPM  (min =    0 RPM)
		SYSTIN:                 +36.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
		CPUTIN:                 +32.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
		AUXTIN0:                +25.0°C    sensor = thermistor
		AUXTIN1:                +36.0°C    sensor = thermistor
		AUXTIN2:                +21.0°C    sensor = thermistor
		AUXTIN3:                +26.0°C    sensor = thermistor
		PCH_CHIP_CPU_MAX_TEMP:   +0.0°C
		PCH_CHIP_TEMP:           +0.0°C
		PCH_CPU_TEMP:            +0.0°C
		PCH_MCH_TEMP:            +0.0°C
		intrusion0:            ALARM
		intrusion1:            ALARM
		beep_enable:           disabled

, with ALL of those now available to desktop utils such as KDE's (slightly broken) ThermalMonitor plasma widget ... (need to figure out which of those are the CPU, vs Mobo, fan/temp sensors)

I don't know what, if any, issues are introducted by the use of `acpi_enforce_resources=lax` ...
This _is_ just a workaround, yes?  I.e., BIOS still should have a fix?
