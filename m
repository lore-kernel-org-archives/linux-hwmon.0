Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 062AC33936F
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791909438; cv=pass; b=L4IXf0MxrCk5T0u3IS+veSSNBKhYxAHFHmhA1NW0kpKZWnUyYqxZ1pVvLA9eQlpg1pcvKdB+NV4MAtWmJvBGCVkh8lfqQiAXewiYy0v/pYkmWYM13IM+CuddfzKW8Z2ndY2m8DEbpbHdFlrn+W3Kd37pTnw459ARbBQqpm7FSN4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791909438; c=relaxed/simple;
	bh=Eq2KZhhUSQrmP1HyR1rI1ZF/uludxMTzhkiL1Jc23EM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=LjxKDkSa7AxjMd7IS13BjB5p/S7RV72e9uTSzZpyP8Il/mY+kq/crKWoenIThUYcdzbkC2giVEOIyGrzJ45z0oZq4mNpNaTip1DjbksD4ZOg1FRJU4p4+xVBWroDOgwNn1ztgFADY7VlmqAAmMS9xQkkOhHZFRlooC85PRqAJrQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eHXOtPuN; arc=pass smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eHXOtPuN"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93e027da22eso216566285a.0
        for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 09:37:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791909435; cv=none;
        d=google.com; s=arc-20260327;
        b=O4RuQCJXV7U9kolc85Cnfx703ZoltDXnB5HoNtk8fGve4umJHEsz+0a6I3cbLtGbQj
         CvEEnQtU9tqH4+ZrAUqjP3Je+QlPuNO/dlbziF86FA3EnFRH1FIGgx6h3Rn/jhkQQ5AC
         Vhfc1kmMQfSxCe0w/tem+jeZKcbSARlruaFo1k2f7DDI0Np09ya1h2vCpJcZ0CWSQ9OL
         6lbKJpCs2/+jnP4naDKRT+Sc1ipxki+JmFnwKVr3lIIjAz3bbri/xgB+sIM94Yczk+s7
         s06BWFXCz0D0YySHAyiPmGsQ5pXvkw5b6FdnC4s4Q4pmpWj+lkcVr3bUYaHaCpcnmJMB
         VCog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=Jplqy6t69dL2hO8aEoJgpF8/Gs1FR9FY+2WKNsRIJq8=;
        fh=RMsWBsZ6SZ6r9IVm942FKhkB5XsUuU602NFjH0Mdz/0=;
        b=k7Kxgd93Gnv33rpKNC/ifXhljyrZMvsQ03Np+P31C4fdvr+wxvHKgO/H7CbGl83bwK
         zPZaUnC/Q/p9Dd9CRKnjo6xRSJK6HlPyI8jCgf5sT5iESwntxvK0Niq3ONBEdbeKEGRK
         kY5H21JuR0FJ3CF+aRvpXZFdy4qTIDxwglO7r5TFeue/Gb1EQocugL8PI7FuwZ3m7iEF
         u/OkSqL/88StdqV6tUvdFhVSwfDAnQHAwH477b7jQZVNHFPabudk5kReHpi9awtVKBdE
         IcfQ+mZee0hUg4c8TjxttO8yYrS7RxFEe+CBqqAKpLkLwXPGiGO911FXqO8SsjMIhzs7
         s4fA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791909435; x=1792514235; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Jplqy6t69dL2hO8aEoJgpF8/Gs1FR9FY+2WKNsRIJq8=;
        b=eHXOtPuNLoykNPf7vawCj6B3U14uNBnaOXQeKSfyhS/M/7hrIGy5Kz+GTFXxeTVz7c
         ynhlt11cMOlfckWHIrvpUpeQUeGg4CRuiar/4p8xutW5oR9FNnDUy76J2lSf2jejGxH8
         NHwyQToFiFI1apY72+gn/WYvaV3KT2Ko/fMe5EXXnd2c7ct20my1VcQC5sUbh/aSIgih
         ED4Rc3+wW+mnbrBoKWWBwebjKuPrn2nN47nqP0ynKlGaUJk7yEY08DYl9VdOpKaho6Us
         hS5Fm4XpqVMeQ0GwwQKsIflopAxmjs0/7S/oXyEXdcHdBKqhyKLtDjKe+qZ3DNXWNAay
         tqPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791909435; x=1792514235;
        h=content-transfer-encoding:content-type:to:subject:message-id:date
         :from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Jplqy6t69dL2hO8aEoJgpF8/Gs1FR9FY+2WKNsRIJq8=;
        b=TnXRRzEnB/ukhn2MEliWLeNMiYFDTWuA27yg9SCjllC4RsHMiClshB2vwYtSEZ+9/8
         z1LMp/63YkLW0G0+qWwfLn+Kgjkk7vRtT5pScXn5Ei9QXPyXvrIKXD42e9FZvA/Yns27
         e4r+ELHOu2LksksjYFUPyBI1jjeysxNG+ULncxhK6DzoBtp6RV4jrBLRhigehxNlCjqA
         0JCuZ1KogV8M+D7S1589wGF85Va01phu2iOk8bbxyPrhjThTjzCR99ZQn2NdKb/WLegX
         9Xd+f+6CrAwjm7qVIK+g7qcAYECgOI552SqGgFqlr/ONFL/kno11SSXcoZTqEcMLSKOt
         nqpA==
X-Gm-Message-State: AFq9FYKORhDU3lI1Vfz6Txd/Df8CZIQ6IAgNWKQ9WsRGC2UOMmO8zfk7
	wG1rYwAQMelIyiMo8ah3V7eThkPg6enPAfmtvYAZlgmZGHoNgaIiBXQ9CSJ6y17rsLrOfdK1r40
	tTI/PR/j0sRJwbRfbEsraeIpXrkL7LKREwvLLDj4=
X-Gm-Gg: AYBFou0WXzd3ZIfdNGcQDVxQgN55lgmSvME8lH4ERbOubXrKOHHhGE2vzY5R3co3vxn
	1A9PutTksWprAcqxXybm+94fe4zgxAGxa/p1GQnQtgUJIzGR8DhmkllyGUKLHERuylyDnLvKWTP
	c5t202kxga+gtKStO3npMr0Ok3e0Mm88bwrTob+lWlO8kWhfz0BkfQnjHe8xNONH3Y5ux2UVeaL
	344tAdTKAemx3/WmNQ4cWQnYHtiriOs2Cg2fitfew8Vj9oc8Dd89UVvg1xeJSK5/RPBBt467mAz
	KJzcavXia1cMbeXDpbjNYJBbZt8e9nLYTJiTmO7sQHrJjV54XKz9W7RLlw==
X-Received: by 2002:a05:620a:880a:b0:939:36f3:fea8 with SMTP id
 af79cd13be357-93ebd1bb384mr2137118585a.25.1791909435359; Tue, 13 Oct 2026
 09:37:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Qian Xiao <heyheyco@gmail.com>
Date: Tue, 13 Oct 2026 09:36:39 -0700
X-Gm-Features: AclHuK9vKUV0TaNToDOZvdjfP2-lqvtDQSFRIqNKZc6WGDA3bBMCPU9kA0_mp3k
Message-ID: <CAFGXJCm6ZWK0NsFhZ1_ycgYtTTT3nhqj9mose60t+Rrry1aPvw@mail.gmail.com>
Subject: [hwmon] ASUS Prime X470-Pro: possible fan-control issue with BIOS 6251
To: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I'm investigating a possible fan-control issue on my ASUS Prime
X470-Pro motherboard and would appreciate some guidance.

System:

Motherboard: ASUS Prime X470-Pro

BIOS: 6251

CPU: AMD Ryzen 9 5900XT

OS: Ubuntu

Kernel: 6.8.0-146-generic

I've noticed that chassis fans 2 and 3 are running at approximately
2000 RPM even when the motherboard temperature is around 28=C2=B0C. The
system is noticeably noisy.

Recent sensors output:

asus_wmi_sensors-virtual-0
CPU Fan:                 1403 RPM
Chassis Fan 1:            407 RPM
Chassis Fan 2:           2027 RPM
Chassis Fan 3:           2027 RPM
CPU Temperature:          +41.0=C2=B0C
Motherboard Temperature:  +28.0=C2=B0C

k10temp-pci-00c3
Tctl:                     +41.4=C2=B0C

Both asus_wmi_sensors and asus_ec_sensors were loaded.

I tried unloading asus_wmi_sensors using:

sudo modprobe -r asus_wmi_sensors

After unloading the module, fan RPM readings were no longer available
through sensors, but the physical fan noise remained high. Temperature
readings were still available through asus_ec_sensors and k10temp.

I found that the Linux kernel documentation for asus_wmi_sensors
describes known ASUS firmware issues that can affect fan control,
including on the Prime X470-Pro.

I'd like to understand whether this could be related to the documented
firmware issue and whether there are useful diagnostics I could
collect.

Would checking the WMI method version be a reasonable next step? Are
there any existing reports or recommended tests for this motherboard?

I'd be happy to investigate further and contribute a fix or workaround
if there is an issue on the Linux side.

Thanks!
