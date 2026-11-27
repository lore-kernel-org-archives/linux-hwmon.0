Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.75.36
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795765531;
	b=YbDwAJNx3c0iOO397WaigYeoznihgTWotAlIL7PZVWS4iHSNWTwhoBqFi64K1wML5nPx
	 SaHUO4DEJCEJqW06nWbX6C0u5SP4cS2lNWdg6gXhRmMlz+1Oooe+Y/6tgwGpLA3gfbGn9
	 oa5Il0kxkrjtHXv1SYfwnl3f0Uc6avVfA6RuNJGUXE+3CkAyFv7IFsJXQPQCTyR3A23qK
	 DbX0Mb4KbF1NPTW4EkErcvLaRj6k0mBqGEblPaVrS9N8pIANqKN9LzeRvgMi3mXellxqs
	 afTGLGr8xrm/RH6F2v8nX6thEo/6I3DU0NQKY4Qm9f2XB0YsFHAxGXAad/x1t4EfczQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795765531;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=C4FU6Rt+p1BUoH1hkshjJFYtMge15QBdjkevKEpYkXY=;
	b=wCalkRVstWtk2LqsqPi1Uh/JnHZGV1+4wsbyiypX9c47fSkzdZJ0GhaOUfkK/vpe01RC
	 KvMIyIaRU/sE0OrlKPNMbFcTTZkfEK86HjhCy6StyY5YHGoBUgqtOXhopEfBL9fpK1LNz
	 Nl2vDXfGS3I0nNgqzMTkFqRiDaimhbWXv8KHG7PDpXLapaSclwhUjdQ8p9SKqYx2/6eYM
	 ia1GYwlGKLyHC0ZrQ0x3cGSRDI2A6DRIlt4/n83vdz17OFwdJppnstJt558RUZAE+sz2u
	 LuHuReRVop9x30JBPycGIUs74wIX9NEMRqviteYQijiwDRrUc2ybUyp3TsMWLYAZN8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Dp8ueI0C;
	arc=none smtp.remote-ip=46.105.75.36
Received: from 2.mo561.mail-out.ovh.net (2.mo561.mail-out.ovh.net [46.105.75.36])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8575E606A323
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8575E606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Dp8ueI0C
Received: from director9.ghost.mail-out.ovh.net (unknown [10.110.54.182])
	by mo561.mail-out.ovh.net (Postfix) with ESMTP id 4jbQSM3mF4z615c
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 07:45:23 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-dkqtv (unknown [10.111.182.117])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 5DA8480F28;
	Fri, 27 Nov 2026 07:45:22 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.108])
	by ghost-submission-7ccd8bbbb6-dkqtv with ESMTPSA
	id +aujBBI1CWsizRQAjZbTUQ
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 07:45:22 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-108S002c55f724c-9513-494d-9a9e-2ec719e0d40d,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH v3 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 08:45:15 +0100
Message-ID: <20261127074518.3244152-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 3824400511620607983
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGRm5LRGWOGr3Q/y7LT1oMHCsL8H5+3NYr6X4u1ebFdDbQJnTB6UFmVNg6BHTxdhi6mvcL9nNR7reQPbuImsxb5gcqgREWsPon1IaYq59UaEytq30r8Gdy2P3LekVyJCzRrVETXQTGjG24hALGmjjveCppPbYnS9nD+Gk2baGpdLWXMsNogv65Pq4jgE6GK2OVPQlQ1VI/11fiCon0Yf8ANFu0v73UokQMb6CjFwjMPAO9vXpKBhCl+9siRFDJwrPPrXC5lslr+MngOqYxrvkvCNm6meGIwcfaOiMa7iEIUHtppiBWephrHZik5Sd6w1bug+WGqQokvD/LnRgFAErsOta+49RqIuWXGtv9qk1EOtkR3f9XPmattNZh7Jjjmfm4MyGdYdc2SazEeTsyKfC4liYSOHuMpwistYY9KBMbK6UXjCGmDcAM48VLxHW7iOw4Tri8fIJZjXEZztRWIbRkCasdXFNfNvUq8jBJVR9GlfEBYtjoFB7fRKrqgAk7n0urb47zqVEFGawMt6ChMn4LEIbtjyyuZXs2Rp38HnMBWbo62C7uwotl/2OQ2kO5GSXblXHpFFJPkqpJjfWVO078qz5VK/NfrNiVzkszUBCC0xUoNSvqxMn85xg5qdN8qGMcIUgmQ9TDJrH+lFaGo4/1taH3vipAOCrsHQ2sru0ZiaA
DKIM-Signature: a=rsa-sha256; bh=C4FU6Rt+p1BUoH1hkshjJFYtMge15QBdjkevKEpYkXY=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795765523; v=1;
 b=Dp8ueI0Cv/hDuS8yIWB7FITXb1epWlWT6/KPBt+xyrQ7Q8doY2VLacHJQZq8a5jX8W3UrNwA
 BeTRK3UhmF7X5y0G6Ct8tgDkrsoqIE/sAflCNFLFtrm16Y5lNujiTG0xP+hgRFfXzWG+nJUvNqv
 Wtw8xG+b2WAncmxr3JxHyZ24/EsEWWO98rWhoJgP5suqqQKuxw0uoAGBPj3FGIQ/X3YJ9/A53oG
 2Oj0Y1axQiHN4/8V1gLVN0kv1WfvLoEXKdzU/PltLIcwnpwBjiHcDLu0iHpGlCJiLxlZxssV9fN
 op3Zz5se8ZWCoqcy79zDOSiP/Uvw4qiDzLQ5cEdEo+DQg==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Link to v1: https://lore.kernel.org/platform-driver-x86/20261113074347.2301465-1-filip.golas@3mdeb.com/
Link to v2: https://lore.kernel.org/platform-driver-x86/20261123105821.305527-4-filip.golas@3mdeb.com/

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 394 +++++++++++++++++++++++++---
 1 file changed, 356 insertions(+), 38 deletions(-)

--
2.56.0

