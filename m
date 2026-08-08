Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A60C03AA1B0
	for <linux-hwmon@vger.kernel.org>; Sat,  8 Aug 2026 04:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786162932; cv=none; b=if7sXHouy1AS6fyzsnj3wRneghQtV4OwtHKAyiyZygAJIHd5FH7RdXIPYl0PkQEWFLrpbq1wqvLGobHFoTEAPm2k0s4kUSeSSf5MiElexU48j1W8O/kiEefUWhDcx4X/VextP0egilJgh0wN2zArxtzNCOFZ2psfbJuZCfAdo7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786162932; c=relaxed/simple;
	bh=D52eLs5047SH+FWCrMZEVKvPXsrjDHryEqfXIYiBGn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UbKJekIX/kkLY0U0FWbqVC4ElOZN+k9xFQ0UkL6VIKHhp2NSlKS5ICt1aFfylWtCwW+Y4VAY1dfKxAIgHm7u+QSPJpRlUudP4FGbYteKRfwwTOV/v1sX7jXMP/Gjk0UtJlKp08JU+VDXwAAP3v8XNx94WlH1vE22x0N+XumlBQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lJAG8VjS; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lJAG8VjS"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-caf45fc5202so87302a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 07 Aug 2026 21:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786162930; x=1786767730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D52eLs5047SH+FWCrMZEVKvPXsrjDHryEqfXIYiBGn0=;
        b=lJAG8VjS6/nXSWJw3YA9kKLFyhCE8ahZMmvvBKmMrfv5mAiNidpqGwGDxovs9x7jPQ
         6hIZfFmntrHneZgDJ850p4oREXhBw8Dhx+Mop4gamV0Yy2qTLBEegOY0IRepc7mV05aN
         ya6pnILQROIl2OraAgu+/IL3BXGhRRr2QA5djefxoG3Hw18BfxykfH3NUln17k0fxaQk
         tDThAhXWBJKgbQuuCAfel1lV7JbZlVDNe7n7m1hdXkKDmrbbyEmKJ997NVn4ywcGTBf5
         +attVzLid7fGjzIF2DcCL1s+q0F95KvLP4sjwdfg90VvxCgQfYMfIw+Ow9i3wO9XwZgd
         JZEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786162930; x=1786767730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D52eLs5047SH+FWCrMZEVKvPXsrjDHryEqfXIYiBGn0=;
        b=KRaTuJInhpOBN+V40/K24n3frKYazj57FoUl4i4q0hojPnQcOyPH6Wf07hepRAvg96
         87mHULMlG4Pz+Q0w9T51rYJrEnCexc9bDIutIZAz1LN6FDi4s7i3RnyZIconsMx5l24J
         HAW/MjakNjBqMAOeZFF27mt2ESPSbwWYzJh6yIK7k7g8cFjHL0wjpscsg991v0pzW+3L
         diVKv4uT/+7EexiGaLfeycPqbYtS6CaGwQmpkLfQmhn7V7sZtqg30wVC5f0vD6VzvMu/
         r2lZjPvw99FDGYNlNSVFVBbWtfHfmK+p5Mn/bHOzka3k+ZeRSQUf6MldMbI2PMr0iJtm
         o/Mw==
X-Gm-Message-State: AOJu0YxWN82WGjGhV7TVGd6H6v4Mc1s/9y0qT2lOWmmICKpaq2Hv0GXt
	hsLPz9zosQ+DaCxQw33uBz0PqH/HLPI809QBmqq269qEfw9y4hNVOwLs
X-Gm-Gg: AR+sD11zRtvqSxO0m1O4R8u6PPE8MC9wE4I20feFbq1z+l7B6VyDpoUaiKQVjaVmSR+
	Ov0LeN3N7VAGAXvPymbQhESdZ3WrByqIuuYR+zgDX4dB+3kefxvhiLid3eIsHm9HArTFEtQZ+3S
	U10CnQuY9XXWu6RDemg7d6ODG78rX1G02Ghl0XhIjGq8TS7WUkic5i9O2IROTN3ehxiEd6dyxMV
	eEtSBYHChDRtM4MsKnNFviLBvVujja5J/Zr+4D8/ILve82coWjPsyIJobQfRhR5wgaBpWdk4X+q
	y3SVsOGCNDXKezZvKgPzU81/q9H+eTd+PLil8PnjF8trmbSCeX1jWjMnn674jWNc1ZFVqfU2Skl
	GT+8im+eodzRnZrsV8rgAInur0JWVbcVvg+ZTZzp+ImNxFYmZ9vUt/qX3enHa772yxhq4Jb9HcU
	iveFBUt0KUPJQZlYVehCdbVPOglSIIgC1tpq1z1ymzJ1IMbGpiG6ZBRbYGe4bBa4qq
X-Received: by 2002:a05:6a20:7285:b0:3c3:a1ed:3c36 with SMTP id adf61e73a8af0-3cb85ee77b7mr30428729637.24.1786162929641;
        Fri, 07 Aug 2026 21:22:09 -0700 (PDT)
Received: from nixos-minipc ([2803:9810:b675:f600:f84b:861b:7eff:7f3a])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-141019c2ddasm13151698c88.7.2026.08.07.21.22.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 21:22:09 -0700 (PDT)
From: =?UTF-8?q?Sebasti=C3=A1n=20Peyrott?= <speyrott@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
Date: Sat,  8 Aug 2026 01:21:20 -0300
Message-ID: <20260808042120.37299-1-speyrott@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9005518b-98c1-4e78-83d5-c2493ad331d0@roeck-us.net>
References: <9005518b-98c1-4e78-83d5-c2493ad331d0@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Thanks for the review. I have prepared the following changes for v2.

> pwm[12]_enable can be implemented as standard attributes. Also,
> looking into the code, pwm2_enable always returns 2, can not be modified,
> and is therefore pointless.

Agreed. pwm1_enable now uses the standard hwmon callbacks, and I removed the
constant pwm2_enable attribute.

> On top of that, the different definitions for pwm1_enable and pwm2_enable
> are confusing. What is the "OEM B1" and "OEM B2" CPU profile, and what
> does it have to do with fan control enable status ?

The EC firmware implements two predefined automatic CPU fan curves. The EC
stores the selected profile as 0xb1 or 0xb2 in its profile register, which is
why I called them B1 and B2. In practice B1 is slightly less aggressive than
B2, although the difference between them is small.

I mapped them to pwm1_enable values 2 and 3 because both select automatic fan
control modes; Documentation/ABI/testing/sysfs-class-hwmon defines values 2+
that way and leaves the individual mode details to the driver documentation.
If B1 and B2 are not useful names for users, I am happy to document them under
more descriptive names instead.

> What is the point of this (constant) non-standard attribute ?

I removed pwm2_auto_channels_temp.

> The pwm2_auto_point[12]_pwm attributes are constant values and therefore
> pointless.

Agreed, I removed them.

> Use hwmon subsystem lock and guard().

Done. The standard attributes rely on the hwmon core serialization. The two
extra threshold attributes and the PM callbacks use guard(hwmon_lock), and the
private mutex is gone.

> clamp and round. We do not expect users to know exact ranges and values.

Done. Threshold values are rounded to whole degrees Celsius and clamped while
preserving strict ordering.

> Since UM780XTX_EC_SYS_POINT3 is never modified, why not read it once ?

It is now read once at probe.

> At least in the current code this is pointless. Just returning 0444 would do.

I simplified is_visible accordingly, with the additional 0644 case for the
standard pwm1_enable attribute.

> channel is always < 2

I removed both redundant channel checks and the redundant locks in the core
read callback.

> Drop "fan control temperature"
>
> Drop "fan". It is confusing that temperature and fan index values are
> reversed. Why is temp1 the SYS temperature, but fan1 the CPU fan speed ?

The labels are now simply "CPU" and "SYS", and the channels are aligned so
temp1/fan1 are CPU and temp2/fan2 are SYS.

> Pointless check. That is what is_visible is for.

Removed.

> Since those are cached states, how would this ever happen ?

I removed the redundant range check from the restore path. State is validated
when it is cached.

> Why those noisy warnings on errors, but no warning if sys_points_valid
> and/or profile_valid are false due to failed range checks ?

I removed the validity flags and runtime warnings. State caching now returns
an error for either transport or validation failures, and probe fails if the
initial state is not coherent.

> This is highly unusual. Normally suspend would save the state
> and resume would restore it. What is the point of _checking_ the state
> on resume ?
>
> Also, what is the point of the delay after resume ? The cached values
> could have been changed via sysfs attributes in the meantime, causing
> spurious warnings.

I replaced the delayed work and module parameter with the conventional
suspend/save and synchronous resume/restore pattern. On the target system I
verified that the selected CPU profile and 50/70 C SYS thresholds were correct
in the first userspace sample after s2idle resume and remained stable for 15
seconds.

I will give this some time for further feedback before sending v2.

Thanks,
Sebastian
