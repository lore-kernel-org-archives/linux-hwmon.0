Received: from outbound.mr.icloud.com (mr-2006k-snip4-3.eps.apple.com [57.103.70.106])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1DC44AB91
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 17:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.70.106
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789753863; cv=none; b=rTrKE+rhyxnJFvKvKNgx0G4/4cst9OdDkFLigMEplZ26E6yiAr8GPZa8q5rIcxedZl234piyiGQmrsdAVPDT0wsQajCLnqxG1j1ml1LWjbH7IhGWLkYIEtnTztywUw6P80tDOlX7bLA7p9oaLJeqqicgch7wolKSewPBnmCFjY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789753863; c=relaxed/simple;
	bh=A93bCpZEXHWwqVdlXoq9rx/HLy+Km47fXSQCnjgX3Hw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=i4jP6iGFF4wsyszRXo1Hw4FkqYW3YuPVs3f70elD5u/uiRdQ6oPBxurt/2vv+CwGMx7yW/XEvMs1JjrMk0rWomZjJ5nsIyDHJEejcAcxW2vz0gykpjTT7cu+M0B8Q5k+SxB9SDztMZMS20gC4QcJ8zB0mnY06Q3iaCZ24ZiAKFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org; spf=pass smtp.mailfrom=brough.org; dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b=fZ87l67w; arc=none smtp.client-ip=57.103.70.106
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brough.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brough.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brough.org header.i=@brough.org header.b="fZ87l67w"
Received: from outbound.mr.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPS id 6402A18000B4;
	Fri, 18 Sep 2026 17:50:54 +0000 (UTC)
X-ICL-RepId: 01a0b5a4-8969-7398-8984-51306ad7d757
X-ICL-Out-Info: HUtFAUMHWwJACUgATUQeDx5WFlZNRAJCTQhLBUMEXRxIDlYCWwdLVxQEElwfUwpcMFsKXBhQAxwfSx8TC1NWUAJWDVQFGQRAFxkKUFAOS1oVVRcOAkIfUB9MFldDWhkcGVoUXBhTRVEfVFhDGUVWaUELTx1dGVscQmRYVwkKCUAfTB9bQ1gZVVBUEVdQC1kCQg9IClwPWgVFCU0BQw9eBkYIVQJAXQRAFFgWcw9FBEcXUVZcH1BVEgRACFZQVB5BBFYVbAlYBlMZVw==
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=brough.org; s=sig1; t=1789753856; x=1792345856; bh=Q53xC3A/SzIHxMkADXMrb47M9Wcqy5c7S5T6BoqbM3U=; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:x-icloud-hme; b=fZ87l67wl4MQLY7tB/MmsawPy8wUv5RbIXqkVj1UxdGLF4Jwg2N6F5cbS+/7YcIdv7L7TN6cyE6Ee2MjcS/wTbmI+XoEHgHuhEqnkHEFNeObUYJ5Sat/7AYJTTjVsPoiDeAzKdXXZ8JOS0d9l8Jger2YHx1GlSnqzxvgbDJvX41vcCx0bVIs9LIT65b4ULwIou7mQsdh2HzwF35Ig6XaPv3SrBFU9X3439ieST+1M1hlgb5d4AyUD5rXtyiIFMX9+ELqGLu3jo/U+X0uGrVX7lXwCWwEHzw6grjNLwKfOrGpSCjAhk9CtkIU3Mzr1H3bxhy80OfkXxm9AUrUVd8Ryg==
mail-alias-created-date: 1646594351620
Received: from jb-desktop (unknown [17.156.200.36])
	by p00-icloudmta-asmtp-us-west-2a-10-percent-0 (Postfix) with ESMTPSA id 61A45180012C;
	Fri, 18 Sep 2026 17:50:53 +0000 (UTC)
From: Jordan Brough <jordan@brough.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Henrik Rydberg <rydberg@bitmath.se>,
	linux-hwmon@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jordan Brough <jordan@brough.org>
Subject: [PATCH v2 0/2] hwmon: (applesmc) add charge_control_end_threshold support
Date: Fri, 18 Sep 2026 11:50:50 -0600
Message-ID: <20260918175052.85461-1-jordan@brough.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Info-Out: v=2.4 cv=JcaxbEKV c=1 sm=1 tr=0 ts=6aad79ff
 cx=c_apl:c_pps:t_out a=9mRn2PO/+PIrVdEbaIuMPg==:117
 a=9mRn2PO/+PIrVdEbaIuMPg==:17 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=gFGppuTrAAAA:8
 a=KkmlWvqn9QTkv74mO74A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Y0xhhAoguY4gwfEQMhp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDI1NiBTYWx0ZWRfX48U7TXftgdJY
 x8TNAsXrnDJlGiw3LBUDr9X/t7Opg1J67RBa9NRLVZwH8A3CBskm4FBOgqyvSRwhxet8wkmdFWd
 PAVuEyPkuOgguimQJCTezGr97bSC4vWRw6gRsDzVu9AlQpas4ZBKN/2zd5P0Es5iQQDGlp+2gAf
 9TvOqSFnf6s8wGl2dMgDVcmYMO5Yxv9diqX0raZPO7qxcLWDCLJq9A4Xc30hRZPQ0WlbeD3UK4m
 kbxG6p9RW5Ozolsu77vkd0VK60xK1rsMese7LcdQWJdLJJH4lmgTJxlf3gUtOUcRXYIALz2glHt
 cw88oT8uKl8v3j3+lV7V14V5yDnRcc5Ouf0BYpE8ABC/xVHDAlJsT16Ba0M7Go=
X-Proofpoint-ORIG-GUID: YAe7-runcocFiPAgCfxOoHJZDiiZnojF
X-Proofpoint-GUID: YAe7-runcocFiPAgCfxOoHJZDiiZnojF
X-JNJ: AAAAAAABlqB8QIcVnpNAWCxnkzpOqdlvbS0vDyUxj28VgthQYptqGCQrg65icP62ei59L/lL2unulkpcA1gvs/HBZWW37IDmBPwlUyod7p6aWhCvqE1qlygKgRQgkU4kgzocZy6GR1+EtMe8TmXlyNJETwyJwc6hVNvvEV+oOxCfm56zkNFrxy1/Vi8t+FOkgDfN2MOH5I1LUlCWb+0UAqYk6JfPBcIfyLhwj9+X0veVOuTgwCz1HVyR9wFUzMaHn+pPh6WR5Fb6cku35mDoZJVfQ4rmWO+SuWvPazhGuCOtMIOSY1vwf/jzCNShgOCe1rWtbJcHoPUAXdOXCQCjqo8bGXx9R61SeNTwBJrqYfk4m48lSIdJQN1O9uQa+W7XuhYtF+gsfMTgwOSoeX2/lMqPWvqnSKQYqVtpI6pILx/IvoY8T39EBwGiTCTSrU5lMyMk4gOPJT2I0E9Wh6GNiC6+5NYdt0iGvvOOOLsjH0l2JZWITuJuT0zTYGNGXiNZDkB6vviAYqSjFZCtjRvmEQSuU9nStF6FttyUlQHELwPQ4FXcyEwTnxcvlBjBoKX3NGVrXJOKu7mGm/KmGW0o8pXxs8zWiWuZ9L/YFrVbWxDxcwPXMAPjczrkbokBkDvS37CkeV5o17UM0PxPhOa5/c8w1OU3qPSacDjlTwa4OfFBfixaEg5YmnvcWw4kddd9j7iJ1LGuAvFFDJ6NU/+4DWHPlhIlh1ZWV+Wv74ItZ7mc25+gty30vdwTseNp0v4YkNOSMdMkA+fU5LyZxKMHbbH+r6IfNZ1FkyHfsuMZYKuPSITNv7LQcHBlX5LWgy0QArNDiKrMsHQpsvZ+j2cc6dOhYqJhQJGnyLvyyXWzhNJQHmWfvZJImmLBlT6KRHbzhMjxVWgDTNV6SnoF/fXsc51gziXHyUwkkr6zHOtJ0arXOyaWnf8KiNl1opvM2wuk/TwNpUd7gYUIUisO0Ny5FPl5oLhOlbP
 t2ljbYHnAupAOUf1nB2zXBvb59DcCT6Ra1JkZs3J/TolL9kGSQUoBb6TVwORlYPRKjRqQ2U3A/4JvaULd/DRL2WPcWQlp4gY7krZNrlM9AeCs+idjMcyMGRJZWiVpEykOkbOhUMo0py+Bg4PZnBcdUUt9rUMVL061BdChHUa0Ys+rnX+DnQYaSOGccHwBP3WeNm0XsXbiTBihwhefiXq7ZR35g+HAhywxG7S/FgHypeCCYV+tLomMIq6hodYIpgZn5d/oCQ1njqT+vbs2vFvdbKzdy08lzN+s0zHWmfNAVRFO/B4IzegiL5HzveF/JWd7lIbCjRFrydCzlfjYtsFkRHXRMbFgQvBSE8SPY1Jox1yrS6m+lTtcojwtCU0S/nw=

This patch series adds battery charge threshold control support to the
applesmc driver for Intel-based MacBooks, exposing the standard
charge_control_end_threshold sysfs attribute on the battery power supply.

In v1, separate SBS battery hooking functions were introduced in sbs.c.
Following reviewer feedback from Thomas Weißschuh, this version unifies
the ACPI battery hooking mechanism across both ACPI Control Method
batteries (drivers/acpi/battery.c) and ACPI Smart Battery Systems
(drivers/acpi/sbs.c) into a shared helper in drivers/acpi/battery_hook.c
built directly into the ACPI core (acpi.o).

The public consumer API signatures (battery_hook_register(),
battery_hook_unregister(), devm_battery_hook_register()) remain unchanged,
so existing drivers require no modifications while gaining the ability
to hook SBS batteries where present.

Patch 1 extracts the shared hook mechanism into
drivers/acpi/battery_hook.c and integrates both drivers/acpi/battery.c
and drivers/acpi/sbs.c.
Patch 2 adds charge_control_end_threshold support to
drivers/hwmon/applesmc.c with mutex synchronization around SMC register
writes (BCLM and BFCL) and error rollback on extension registration
failure.

Testing:
- Validated on Intel MacBook Air (MacBookAir6,2) with ACPI SBS battery
  (BAT0): verified sysfs threshold read/write, KDE Powerdevil UI
  detection, bounds checking, and hardware MagSafe LED transition between
  amber and green.
- Validated on Lenovo IdeaPad with ACPI Control Method battery (BAT1)
  to check that existing in-tree hook consumers (such as ideapad_laptop
  conservation mode) continue operating as expected.

Changes in v2:
- Unified battery hook infrastructure into drivers/acpi/battery_hook.c
  built into acpi.o, eliminating duplicate hook logic in sbs.c
  (Thomas Weißschuh).
- Kept public consumer API signatures unchanged
  (battery_hook_register/unregister, devm_battery_hook_register).
- Added applesmc_bat_lock mutex to serialize BCLM and BFCL SMC key writes,
  preventing concurrent write desynchronization.
- Added mutex protection and error rollback in applesmc_battery_add()
  to ensure applesmc_hooked_battery is safely handled if extension
  registration fails.
- Added mutex protection for applesmc_bat_get_property() / set_property().
- Note: v1 was acked by Rafael J. Wysocki; the Acked-by tag was dropped
  from Patch 1 in v2 due to the architectural refactoring into
  battery_hook.c.

Link: https://lore.kernel.org/r/20260913231410.416922-1-jordan@brough.org [v1]

Jordan Brough (2):
  ACPI: battery: add unified battery hook mechanism for ACPI and SBS
    batteries
  hwmon: (applesmc) add charge_control_end_threshold support

 drivers/acpi/Makefile       |   1 +
 drivers/acpi/battery.c      | 165 +-----------------------------------
 drivers/acpi/battery_hook.c | 112 ++++++++++++++++++++++++
 drivers/acpi/sbs.c          |   8 +-
 drivers/hwmon/applesmc.c    | 157 ++++++++++++++++++++++++++++++++--
 include/acpi/battery.h      |  10 +++
 6 files changed, 285 insertions(+), 168 deletions(-)
 create mode 100644 drivers/acpi/battery_hook.c

-- 
2.55.0

