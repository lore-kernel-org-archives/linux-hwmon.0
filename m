Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793273478;
	b=nGX8jy7I7pZB66Wnyr75c+cpEck+4FOhkekQND0SyCJEc1aRdmOUCdSfQascjLrEOIOE
	 GsJB1LmnRamWrR0gjhKMgDDLi53drmRGzuCUGG9BEJ4vzsFzh9hPq6X79bwcveCCY+KDj
	 zUW6kksgmCPjMN6BAulHYZ8N50/PxsiRJ/2Xh/ecDksyhxQk/fhaob7akueop0Vngqi2h
	 Yo22Pje4tA/efonPB3beeCfYBK5Q9zLDDL5Bxe5CeG8DQ+1HxcTCzWqWofhWTYtYUc73N
	 zS16qWvp6BCaHmWr5grfRNCEiw+u3NsydOTGECG8DBQfgQF3N1F6/sh/wRbBjRTgYSA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793273478;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:MIME-Version:
	 From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type;
	bh=3SQrvwPimPG3P9Im7IUY4TrXOu3eHe5fTckKIVHUiq8=;
	b=XSqAiRcA+5MSmAJIVRMsg7ei6Ib8ABHSBeCW5hV1qNriUBeDbV3epwOdm2dFgU/wYywq
	 Rhzm07Q1GX7RraUTaXSRU2uLcbxPECcsG38MGvqqoARwJSJXdNIVMkuw5HZzuxf4SOknO
	 KwWCPAmIpNMjA2fmJEdXOD6nVs8CM+EqLlFfRBhzS7E9qETIBnxI4IhSs6eZuqyuAoWTC
	 13ibLs72n5Om2wPm/+zG8SyQKweY/dco8nWp1JQxybw9x+5kkzg5rL0BtyRmc3HM4yOT1
	 WiXA/orU6SnvtmzIjEr5sTKoNzvNeJBp4ixO142662Ofcjun4cvHZP5IEDaWOIZMT0g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqhANUtl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A1606A327
	for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 11:31:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89A1606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iqhANUtl
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c450ab1483cso316888566b.3
        for <linux-hwmon@vger.kernel.org>; Thu, 29 Oct 2026 04:31:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793273476; cv=none;
        d=google.com; s=arc-20260327;
        b=rrexfU+67ee8dVGXAW7hnIGNG9P7dX7M0ir80rqH17FyGfHSIGiIs47Rx+8W/zHJeh
         pI+tausKdrS0JwCg+LSX0SPmJRmvZO3zCHsypISeeFsGELRn/EPClx/J1csMpk9MuSbT
         GtKMc6+U1ksxtRAysxyH23zfEl+a8VuNVdnoOvreq/M33nzFroIrg45Zs3X635sFIIQB
         jX8EmbU2YnnZ1UUZx9dVJt3C1+RQZNfz1VkevuMbdFIMmR+c+YSE/xk3VwFBRNg3nLXq
         kkNSWE72f+E1cQNW6+6ZnW12ZUvKHzRFuoCLGztpcQREWdGhN/THxNixy17jZGsFdZGi
         guKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=3SQrvwPimPG3P9Im7IUY4TrXOu3eHe5fTckKIVHUiq8=;
        fh=wviURn1HtI6PelTQNED+i9Cx0KBJLNUrS3CCrzGVghg=;
        b=T+SYZLO8opx8sAT3xjCsYl7/edbXhmlTfmEFEJmLEc14CPcq1EdAIuO71x0wHTUS2p
         /ZkDuJee3oqwIOCkcFY4YS/T9uz67L9RpfOvAZVq37Gkgf5V3YNtCFeZ2zneqyTPjNBN
         x0xVKYdcYG5GDq2qIDNkjuYH4AoOe34czfStU7BnLusFh1tNZ+TZLm1blRadxYWcpyME
         GLU3ayASBiFIQXndij+O1T4nSQLUpx3g1HMyp4KcKFQfrM5L5CNkW817HLiLPoik5kjd
         9BkZI29+/nOVi/DnS/rnTjUJ7kenar/JZzxdnFIy4XMC5mnnMXepCo3pNBe+bM3YF0jG
         W7UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793273476; x=1793878276; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3SQrvwPimPG3P9Im7IUY4TrXOu3eHe5fTckKIVHUiq8=;
        b=iqhANUtl+Drd4lW4cqClAqBbKb1i9YrOtibIbO9TAb1NEucLAFgD8sATVO36VkXG+w
         TYRAf1QVZXI0/8Pw5xDtpcCWFvr6nhgrZNIhEXUCMFSW6/SjCy8LPPT+42xBI+lb3ADl
         mw+bFn+cp7CVwNtuiPRzlFdcPv8uPZRR+4hiHmTJf2rw0BUQLvM2Z04ym6KVO042pK1Y
         urJ2kJELAgDMdubC4HY5RbL1vlynBQoa35dQJBlhMkMJ9vOQObJaA1HX3+ghImH/YFAZ
         /hKum9VyecH/IMCUGciZiJhf9oTKRZumSt7/JNRJ8uTwbvk35+gTofiQ1ZVDRKJvzl+4
         XUxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793273476; x=1793878276;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=3SQrvwPimPG3P9Im7IUY4TrXOu3eHe5fTckKIVHUiq8=;
        b=RUP/sAEJ9PrwidwiKP+0DK/8VO1UovQ6KkkGOrRveDs2VzsApGJzAU87XQnREgWMKX
         5/dFNF0dFHwQsxjNO25vtJ4YdOvLGRLbI8wtI+7VTw7bXtNWD2HEylN/3kbzv9fKzwHj
         cbprDvwSntkGUagWLXOCZSf9WwemN+DqlDMz+2MvrzUdaC+dS//KN4I6HfEwKA0Qe5GK
         pRca2+lnJMX+JS3JkGIz7YKYYLnkFTvLVVOnLIXPVSoYyodwIlE8a5McvrAH9HzKBzJ/
         yZloGskqjAehlxx599ZCDR02k7dOi9CrH6DXLuJb6T0HYtciQBBhAMoxyGU4gqeOfELJ
         L2lw==
X-Gm-Message-State: AFq9FYK+nfo6vZJBEiBlKUiC+30LiI9JL3xfHF+wBfUpT/EyMQGQe5A9
	lcpxOPVJhX5xCNenKVPphS/68vAXAHQqM1zAV1es186Jo+ZKfa3XPRmehrXSl7X+erruEKpHSx/
	CdD/sv8xWigfC8hq2HG3KaqFzjtG9ahfknxtq
X-Gm-Gg: AYBFou26sP+SiImlmypAI0lHl5cS1lszzaMCuErJE96mIM3QYSNmWAI3T+FntVws7gv
	3FwOIWVaOGSrW1e4fNTOMf9lVaAu5fsb1doh7xSTmVsYKFBpoPQ7KQB5nsjgcecGpcr+/jo5QxS
	rUcYbfzKe2uC1KXcOOZ4Ipwo/8RcTnxUsVWaVmyhygKrB4SswjPNxqL3AFrCKFKkKtxFEQUDI/f
	CsyIR598Zxw/I5zyHnxqAKbaSUicnGLg7NlTUUcq8iT+0RF9tvBSva8zaDqOMHwQjkyY1DXf1lx
	5oND1VFZrdtF/8S1PhDEySveLWcEvzWbo9GGQiwnhIUoa/3UFl9cEGlN3VcPaBj/V8oDfOzC6CP
	2rbUtluUj5AkKGEIwtTgL4u5YRD/HgE+jqtWVgUpkEjJ17q0MJj30uX0bxMBYDYIEzWeRTJh7hu
	QwOBzBRmgHDEHdTPfAyLgEvN8dAMuVhBWmKsl5sHNmLrXReg8=
X-Received: by 2002:a17:907:bd92:b0:c49:cd37:177e with SMTP id
 a640c23a62f3a-c49cd371956mr272804466b.48.1793273475827; Thu, 29 Oct 2026
 04:31:15 -0700 (PDT)
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:31:15 -0400
Received: from 77377267392 named unknown by gmailapi.google.com with HTTPREST;
 Thu, 29 Oct 2026 07:31:15 -0400
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
From: Mike <mikedeuchar@gmail.com>
Date: Thu, 29 Oct 2026 07:31:15 -0400
X-Gm-Features: AclHuK_-0BvUsTe_2js-c7FbsWJuGRepK5pLgudlCZoH1RC_LsSOiPrp5ahwtgE
Message-ID: <CAD2WtuOZEtLGkncdKA45T7mV+udX4jt7cZpqqz+xUZ_Z9UVGsQ@mail.gmail.com>
Subject: Precision 7670 SPD5118 resume -ENXIO with confirmed SPD Write
 Disable: supported temperature monitoring without weakening protection
To: linux@roeck-us.net
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hardware: Dell Precision 7670, BIOS 1.41.0, i7-12850HX, original 2x16
GB DDR5-4800. Passed Dell advanced diagnostics preserved. Kali kernel
7.1.5+kali-amd64; spd5118 in-tree module.
Boot: i801_smbus 0000:00:1f.4: SPD Write Disable is set
Boot: i2c i2c-0: Successfully instantiated SPD at 0x50
Boot: spd5118 0-0050: DDR5 temperature sensor: vendor 0x06:0x32 revision 1.6
On each of two completed s2idle tests:
spd5118 0-0050: Failed to write b = 0: -6
spd5118 0-0050: PM: dpm_run_callback(): spd5118_resume [spd5118] returns -6
spd5118 0-0050: PM: failed to resume async: error -6

Temperature sysfs attribute readable after first resume, 30000
millidegrees C. This is not independently validated against
register-page state or another thermometer. No direct SMBus write
tests performed, no protection changes, no module blacklist.

Aware of maintainer concerns in August/September 2026:
read-only/skipped-restore proposals cannot guarantee valid sensor page
selection after firmware activity. Neither proposal installed. We
require protection and reliable monitoring retained, not silent error
suppression.

Request: is there a supported firmware interface or driver design to
validate sensor register-page state and provide reliable read-only
monitoring on this platform? If firmware cooperation is required, what
specific documented behaviour should Dell provide? Please distinguish
unavoidable read-only limitations from a correctable resume callback
error.

No unsupported kernel patch proposed as a verified fix. Local
source/log evidence retained. Device identifiers and raw reports
omitted from this draft.

Related maintainer discussion reviewed:
https://lists.openwall.net/linux-kernel/2026/09/21/1921
