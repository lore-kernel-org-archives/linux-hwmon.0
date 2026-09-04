Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95163C1087
	for <linux-hwmon@vger.kernel.org>; Fri,  4 Sep 2026 17:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788544705; cv=none; b=VqkjnT17B5AX9YoCa2yT3qHcZdN60gVCWxDptbgUws0JdL7CbVZ1KmAyQ5ZLFns4KaQ4qWQ+lYr/rD3M0XWZTXYy2D1hlDatftlS6iheqx44tMrodv7e/fNJ3ZtZ5qNHTeKyEJWDkyCBBTPhqhhkmTUxcpnn9n4pNUrvOCjH2HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788544705; c=relaxed/simple;
	bh=pI2JbNlZVZDDW8lq9rTAQZsCB4xQJ8Xq1HJSt+KCzQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OBSxRABE9yJr1AudlPatLuF6R7wnwKPRVmLoLY5PloPRCkT/L9BVXwZQVDVfhSMrxrYnbV3HBlnY0DroJ9xiwE92YUMZgiCo8bjmTV+xAsssb7sJxrRuV1ZkLhyhRpJDzXz52S3gPaI4VWxuTfgTsY9aNg0f9I/DfWRsXd/jnPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VFpQ1+wP; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VFpQ1+wP"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-38759bcd877so1248520a91.2
        for <linux-hwmon@vger.kernel.org>; Fri, 04 Sep 2026 10:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788544703; x=1789149503; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MCttvfM9DrOknQxq7vF2LggqSOtL8sYj8RJ3yUrgdFo=;
        b=VFpQ1+wP1PCWPl5KnizqDlsh97db/9Ssnn7sIwlvJFlAval0ZlIUA1NWArQaotk25j
         BnvJsLlc5/RIb8TxzvYMWIxkiaeqBtB2QXf/nPcvC535NOKxatNPjYDRvNk0b4WAbOy2
         nISwHad2f93TDY7Dl+AAmoc0PPaZPurFdU6aaXFleKLqQgBjiliZR8cxVqhbGXX/GScg
         19ERZJvob/yBtbjBe+cPFV/ClRHkuVziWp17+aaKtNhJomgjzYAYtxVbm+RjLLs61J1a
         n9bu4+nAzPKMyMV2/bQN8xB2TVk5Mpm/XZiw46uGxOPOuvy685ZMw/BJp1CCrf009fB3
         OEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788544703; x=1789149503;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MCttvfM9DrOknQxq7vF2LggqSOtL8sYj8RJ3yUrgdFo=;
        b=XoWj1rHT1hS1o2mIpxURY/4VKdRpinY/uF20RuXzKAR1Hd/9DZtOEJGH6Mx0R0dAbM
         Cltd7zXvCWsD0h2mmXfdbr6iXPJoUpMnmifuLIfLc9C2z5WCF4rtwBvyTVyEPxBeDK/u
         Na17hzgWXs2z9qE3/C90DQzFjdu5/cR9+JQwyf3wmDCI+jT7Ab2ImJ33zkCE4QMrNlf5
         LzCnLyTkVRla7HvBgKtQI6iALMfHB6J8K38Dv8gb7IV72i9QQfzVrxnGfjKTyl1fdlBO
         3XPppGjvSXFlM3Ab48WXVNpfHMmMGafbX2ebwd8TFCDvQGi8DRnVRDdYLCQ5wG111PAq
         +/pw==
X-Forwarded-Encrypted: i=1; AKwUvBzkuKqkco6P8v+bN0RBHYPqmYbyafE7jG0PtD0mJhlAfbz3Q3+OXz8rk6mK/M0oTD+ZEGmrE5+9HTWpCA==@vger.kernel.org
X-Gm-Message-State: AFuF++mySqqFZZRDqc6vLOfoBqmfjYti1qYOMqPl2ZBpjU46UU8guJzs
	0+3UQXaXITHPVixvCcSn/IT5OK+Rs2AuSKQNtktffvMZ6/HcO0CLb1AT
X-Gm-Gg: AYBFou3PO8a6W08jbJHOSwMcYXZqvqtTJ0o7dV5BpOGplpFcSp6Wpw/gh6YmoXSFASM
	zg+jzTsNfwiaqcqKVjZwvgFCxMAOZ+wPkKbhOxz1f2undzutoacvl2AHS7LOSUzWDxTomydB96/
	/HiTRSmZ3TrjkvvzYn/QHKaV1csxBJ7M3aCbje3hl6LDqkPQSY6GKl10SV7vDKZaNhBLeWhIs9F
	jzmeQxAzV66qA1WVUNt5ZodjrmSrJxpHJt7X2eyrUMQmgsBmkpr2mAD/mBDoi9F6dmmTk4HGWew
	+UVB4uWTeMIEtLEwFfNgHu4CvvpgMhWgXjlpnjZl7TwTfL7ORutWnspWffPBc2DYM0ka5qFmR9v
	UDiUl/ulPLB2cqQ0574rjPf7X8sh64mZktucPwCTgjgQgoMeNGd143jUriuCDDhll4K7p5Lc5bP
	BmZrA+11ZIzO+Zi0ePBiXUyw0dV56kec1bQTI+JT41bNtLmLS5IJuyyg1Bol1arTAMpmmIKo6Ez
	N4sMqYsTmn2Ugs=
X-Received: by 2002:a17:90a:ec8d:b0:37d:f983:7b5 with SMTP id 98e67ed59e1d1-39b26101c08mr11024544a91.9.1788544702820;
        Fri, 04 Sep 2026 10:58:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3339bbf1feesm8215824eec.26.2026.09.04.10.58.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 10:58:21 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 4 Sep 2026 10:58:20 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Matthew Bettencourt <matthew.bettencourt@gmail.com>
Cc: Armin Wolf <W_Armin@gmx.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	"linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
Message-ID: <77e8caab-18b4-4953-8b66-887d5a7b31b1@roeck-us.net>
References: <a5d32ab5-f545-4e11-bf0b-88d3eaa68890@gmail.com>
 <474a37bb-0774-4710-8458-ea28d7c54c89@gmx.de>
 <c81e7caf-d3e4-4212-be9b-ec35d0a04086@gmail.com>
 <c096b0d7-90c2-4d91-9776-9f109679c309@gmx.de>
 <7ca2e621-e0a1-4eee-bcd1-2ded610f1beb@gmail.com>
 <cff09168-9a88-494d-bc82-d9a5e4de22a7@roeck-us.net>
 <e1a6a91d-d03e-4e7a-ba7b-9268284ce7e8@gmail.com>
 <5480c69c-8e98-443e-96d7-30e64e886373@roeck-us.net>
 <02dc7eb6-6d0d-4c0c-af10-b831d3f8ba06@gmx.de>
 <d1a590c7-f526-4e70-a255-fccfb199be39@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1a590c7-f526-4e70-a255-fccfb199be39@gmail.com>

Hi Matthew,

On Thu, Sep 03, 2026 at 07:24:12PM -0500, Matthew Bettencourt wrote:
> Hello Guenter,
> 
> >> - Do you have the latest BIOS installed on your system ?
> >>   Some statements online seem to suggest that the problem
> >>   _may_ be fixed with the latest BIOS on at least some
> >>   of the affected systems.
> 
> Yup as of Sept 3 2026 I am running the latest BIOS, 4.43. I think a new one
> is coming soonish as Asrock has started rolling out 4.50 on other x870
> motherboards
> 
> >> - Please boot the affected system with "usbcore.autosuspend=-1"
> >>   kernel command line parameter.
> >>   There are some claims online that this might resolve the problem.
> >>   I have no idea why that would be the case, but I guess it does
> >>   not hurt trying. Of course, if that _does_ work, we have yet another
> >>   mystery to solve.
> 
> I think we have another mystery to solve. I enabled "usbcore.autosuspend=-1"
> as a boot parameter and the errors have cleared up when I suspend/resume. I
> doubled checked this by removing "usbcore.autosuspend=-1" from my boot
> parameters and the errors came back.
> 

Outch. The mystery (or misery) deepens. So we kind of know that this has
something to do with ACPI _and_ with USB, such as ACPI accessing (or trying
to access) a device on the I2C bus when suspending (or trying to suspend)
a USB port / bus.

As Armin has pointed out, it isn't safe for the piix4 controller driver to
access the hardware when its memory space is reserved by ACPI, even if that
ACPI access turns out to be plain wrong. My ACPI / DSL knowledge isn't good
enough to figure out what exactly is happening, but even if we do that it
won't help: The PIIX4 driver must not load if its memory space is reserved
by ACPI, or it must access devices on the I2C bus through ACPI.

Thanks,
Guenter
