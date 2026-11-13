Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.33.253.26
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794555894;
	b=ejeeyPCdIlbAN4w/MRJQ4Y1POt1JtJxRpqTosPB3h9E/Rs3rWSEOsRgpYzqXskuQ5yN4
	 9hsZjz80Tt2Fxnwf+uGey7H+87qbACgX+Oi5zdxO8ZZIJl1yX7WhjFVE8/rTrAqUDLDK0
	 vBQzgQU2OyhVbYYmB5nwKpR9hIHCeDvgV2nA6YREsh0bSI8eREad4WK4VvpfLuFGmwDyy
	 r7wpGdYkYTjMyCwFSRZwT2bEISetcrHsD/fddlddqCwQ+chsO7cHJ0kwXaOKuE+3ITIl4
	 pQHaVD7Fy9xpJAw1anrQHiek8gJu4WYIb4+zTqn1aUgcE0K5o2xW6nCbvf9ncWCs90g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794555894;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
	b=HTlA/UROPIMfXKsHuWRy9tc8IbS1s70trQ0B/XQNABKjh5eNB+SXeA3fRc/FJZAtvlyb
	 JlS4owubqx+VQtLOsiH4tNC0XlthT29ndasqXwHSyxGDLf1HbOOQzJ0hJI+jJaOcSwZCv
	 bJ4a1lrbiFSJKg3PbfnqhchhJ8wGmnfRa/UDaiYir66we9y+M26f6wUpYsNDAxyAvNPCP
	 yIpngkQR3jrzEdkLaYrxIxAHb3i2yYs2w+QS+qVNplivFgj/q52kLSXXiNdFlq/nsPrYT
	 k7zY66WEv7e+g7LlqZIzr8jRZlTxMpOv2lK3MMi05av8P2ZhloaL7nw75A7RBlUJquQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR;
	arc=none smtp.remote-ip=178.33.253.26
Received: from 3.mo582.mail-out.ovh.net (3.mo582.mail-out.ovh.net [178.33.253.26])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1F26606A321
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1F26606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=Ukxl5whR
Received: from director8.ghost.mail-out.ovh.net (unknown [10.109.249.109])
	by mo582.mail-out.ovh.net (Postfix) with ESMTP id 4jQq652wDnz6DX6
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 07:44:45 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-cl275 (unknown [10.108.42.118])
	by director8.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7045BC0105;
	Fri, 13 Nov 2026 07:44:43 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.109])
	by ghost-submission-7ccd8bbbb6-cl275 with ESMTPSA
	id Hrv+B+u/9mr5jjgAjijQbg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 13 Nov 2026 07:44:43 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-109S0035fd8fd59-fd24-4b76-b524-baffcc7691da,
                    F6EB7A3E9421D9EE3A955D9585EDAC62A977302C) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:37.47.248.243
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	=?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Subject: [PATCH 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 13 Nov 2026 08:43:44 +0100
Message-ID: <20261113074347.2301465-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 13829710031199793135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGasz4azIijZcfQ44mRKseIDVRsJQHwcOwAbF4H3kx1SQD7h3hkz98gtOrr6Bng12qdsgmykVIz6lNsTPEFTmCD6ZK/Twk3VftjDcXmuV/25X9lwtOXhEMu52cE4AcRJk10sROmbG3Sgoi5fj+FqSZZhI3aMxRSsr4S0nblorxNaY6siLWkJ7gI7glRT5NcyzvfFnpqtj1OIBpWxKlgKoO+J1IYkAc8JIXvwvTuryUeHm1rK3hjDDSowqChUb86FY5dKt2QiORJ+XCwNsyKe87PpN6xwRVIJhlLPfpOxYH/PkgjadnZkuPXF2x+ZPDWpHRNbIJxa1RRHueD5rSGnveNZV5hhGSfDPh3+7boDrWYheis9EdeM47httJu3oQ/TxNkyqfTFMkyJDqDHY1iTu7T4Csc4HlIS16Yg3WJkImCRPKN8dny+kWVJg18AA0pVhrnS4GAC2RUooubq8xr9rHzFAznGkDfEBE8t+nrBNcN5JLdS1ez2rk8VeSNOAiz2mWxWBn8fZOBAqN3Fb/KcNFaQs9NDohuYzkLO134QkXUBqNEHWoTrk9nbLZ4H0NMU2wSb8QlaDZMvRtvTuve6BkRjhhqns+b0xdu4SZt6RgarJ1lUN5GaYe/lHsGTx0wu217IfHm8jYQFodDqoQRFk/W85TP53cXbiC0Ee0dWlJuWw
DKIM-Signature: a=rsa-sha256; bh=geFjrhTrW/m8F1nN4gMrD2uUOWJQ73zEFUUwYTOtIgI=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1794555885; v=1;
 b=Ukxl5whRcGvht74lukK5aNZ2blRrCJrKkkhwNnyy32XcAcy9E08Ygu2tmMCNxSCu4Q09NU8+
 eAemVeV+FDFB3+hWHZsKfQG6HxRae8v8Y92O7COhncwCXdhjxwnX/0Mthd6nHoxaSmmg2LEMnx6
 nsXTqltJ5Kyly8YtPw3oaoFL2nXHIdG78cFJnyNXMh+xNhJiqkXHjzC5nmX7SSADO8c8QSCVr6N
 ySTrtpu8fOnRrUNhMxRLQdO434xZ8TYktROCwZ3K3fk4TlB/iO0Io17TL/0+S8EeHzEc1ScG5oM
 OBDRJYkE7kb1n7TGFc74kS6HC+qv/z2t5evF8X178M/zw==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 317 ++++++++++++++++++++++++----
 1 file changed, 279 insertions(+), 38 deletions(-)

-- 
2.56.0

