Return-Path: <SRS0=kkoh=DM=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B81ECC4363A
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 15:03:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 714BB2078A
	for <linux-hwmon@archiver.kernel.org>; Mon,  5 Oct 2020 15:03:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O////Mao"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbgJEPDK (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Mon, 5 Oct 2020 11:03:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgJEPDJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 5 Oct 2020 11:03:09 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0815C0613CE
        for <linux-hwmon@vger.kernel.org>; Mon,  5 Oct 2020 08:03:09 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id w141so8989066oia.2
        for <linux-hwmon@vger.kernel.org>; Mon, 05 Oct 2020 08:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:autocrypt:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=85n7KGAmr3a89ZU52trBcPLYVfILUWt1Gk5T9XCy4j8=;
        b=O////MaooQGePV+5ssBl9DF4T1ZnFN9BYkjubRUn4BiJPLVFoiQzla5oWsW+n0Yjfq
         yVtsCbknYq06PWVNSm3DykY8E0VCCLAA/6F7o6lJd6cxe52Dtf+QVhVWI5J3yMYpGyuY
         oIfyWuq1ARrEnkRIz7Dg7/lyiqfbLpsnt7TSrpK4AIo4xDLouHKV1i7kF4By/2nehrr8
         c45rT5aJdV12HsXR1hsVBEo/m2WyrLhni6r3V0r/m+rraxH4tuQd4vdoqoDzzVhRoKwY
         P4oCGZ9l4tC7bV2vaImE4HKn6bAEo1flgfkO0Le2YzboYGzQpWBEo9t+tuWrjtL5QpLW
         Bbwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=85n7KGAmr3a89ZU52trBcPLYVfILUWt1Gk5T9XCy4j8=;
        b=W9nNKsLgSIW+MOGW67+q388yA887ZHa1I5GVu71/C1UP83EGSMJUpgQuOYEpAiRQgs
         cYZMVNE3+m5DHF1EqdtJQxogjYXJmddhjOz7wg43vgrj0+lKCV8JrF9lukHZRhN3iWUH
         Dnf8rUIT1ATYLhc+UGrjiWBSCNWFHggP37q6dxXcwQAMTpw14qK+M2g51cugnR3UK52M
         NySd0+/oSrCB/DNsvMhVwG2Z5ofScdqL+1/lREyd4cQ+6E4X2nCK8E1GGRvMUcx9O0Mi
         1reji/IBibrRP9F48ZaGNNJZayNxZz+/AAMPycMrJHBCsy0qpstnbtZBjvkq0NMvFIMR
         JrJw==
X-Gm-Message-State: AOAM533n7520GwAludNnuHTvPEL92/+IgkFsYvKgQIW4Zz+bONaYQ4YF
        htVBMxmKE4p1JneiSCBtECQ0XfeWTTM=
X-Google-Smtp-Source: ABdhPJxZ8IDTHJtB4zVNlGTnGfv2PeB514VcdfTykPa0vJLc06ub+9Y4rpoPqfcEtAk3QT8XHkm3WA==
X-Received: by 2002:aca:f5cf:: with SMTP id t198mr35038oih.22.1601910188645;
        Mon, 05 Oct 2020 08:03:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i7sm2943621oto.62.2020.10.05.08.03.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 08:03:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Subject: Re: hwmon: nct6775: If an ACPI driver is available for this device,
 you should use it instead of the native driver
To:     Corentin Labbe <clabbe.montjoie@gmail.com>,
        linux-hwmon@vger.kernel.org, jdelvare@suse.com
References: <20201005075019.GA29306@Red>
From:   Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
Message-ID: <a3a9bc90-ed7d-4966-7566-147755b6a247@roeck-us.net>
Date:   Mon, 5 Oct 2020 08:03:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201005075019.GA29306@Red>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On 10/5/20 12:50 AM, Corentin Labbe wrote:
> Hello
> 
> I have a motherboard with a nct6775 and I got this on boot:
> nct6775: Found NCT6798D or compatible chip at 0x2e:0x290
> ACPI Warning: SystemIO range 0x0000000000000295-0x0000000000000296 conflicts with OpRegion 0x0000000000000290-0x0000000000000299 (\AMW0.SHWM) (20200326/utaddress-204)
> ACPI: If an ACPI driver is available for this device, you should use it instead of the native driver
> And so the driver is not loaded.
> 
> Since I dont have an ACPI driver for it I have hacked the driver to skip this acpi_check_resource_conflict() and the driver works well:
> nct6798-isa-0290
> Adapter: ISA adapter
> in0:                   936.00 mV (min =  +0.00 V, max =  +1.74 V)
> in1:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in2:                     3.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in3:                     3.33 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in4:                     1.01 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in5:                   776.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in6:                     1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in7:                     3.41 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in8:                     3.31 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in9:                   904.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in10:                  272.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in11:                  552.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> in12:                    1.02 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in13:                    1.01 V  (min =  +0.00 V, max =  +0.00 V)  ALARM
> in14:                  992.00 mV (min =  +0.00 V, max =  +0.00 V)  ALARM
> fan1:                     0 RPM  (min =    0 RPM)
> fan2:                  1138 RPM  (min =    0 RPM)
> fan3:                  1744 RPM  (min =    0 RPM)
> fan4:                     0 RPM  (min =    0 RPM)
> fan5:                  2402 RPM  (min =    0 RPM)
> fan6:                     0 RPM  (min =    0 RPM)
> fan7:                     0 RPM  (min =    0 RPM)
> SYSTIN:                 +38.0°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> CPUTIN:                 +37.5°C  (high = +80.0°C, hyst = +75.0°C)  sensor = thermistor
> AUXTIN0:                +25.0°C    sensor = thermistor
> AUXTIN1:                +53.0°C    sensor = thermistor
> AUXTIN2:                +20.0°C    sensor = thermistor
> AUXTIN3:                +26.0°C    sensor = thermistor
> SMBUSMASTER 1:          +61.5°C  
> PCH_CHIP_CPU_MAX_TEMP:   +0.0°C  
> PCH_CHIP_TEMP:           +0.0°C  
> PCH_CPU_TEMP:            +0.0°C  
> intrusion0:            ALARM
> intrusion1:            ALARM
> beep_enable:           disabled
> 
> I got the same problem with an it87 and did the same, but does it exists a better way to do this ?
> Or does I ignore soemthing to make it works ?
> 


You could add "acpi_enforce_resources=lax" to the kernel command line.
Your hack (and the command line parameter) may be problematic
if ACPI does indeed access the chip since the chip has multiple pages
and ACPI may (unsynchronized with the kernel driver) change the page
number.

Worst case this may cause a system hang or reboot, unfortunately.
You might at least want to decode the ACPI tables to determine what,
if anything, it does when accessing the chip. You might be lucky
and it doesn't really access it - some systems just reserve the address
space but don't use it, presumably because system vendors don't want
users to access the SuperIO chip directly.

Guenter
