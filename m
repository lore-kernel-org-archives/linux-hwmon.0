Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.56.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431529;
	b=clhE0EflEO2zjGu8Zmc+4slppidWDYZ35O7hhWOe1509ykKURp9vuiHTy+h8CX4g+BEO
	 lYKXtu83U98BOTk5+aoLr2eCh4OzGV9C4wY6u+yBbGzoaPWhgA0WF1Jlr6C78kIBQaE+t
	 7AvvtkPQK+y3U3jfw0hTYezoAjjeezQb6ZtbPXs6RK2zcCIaIBwuueltKAhglsvFVRM7T
	 JG4oNNaUbc8mBbGmO0ZZnsvlDR1pJtZx+YXITe4dnQw83O6DLvP+8lTqZayg4CTf2+k/8
	 71XSnoeHcqRWFC5uKSorCVREqt5rMDUPMSSTl44E3kZR7c8P5PVloz078p+ok5dFRIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431529;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=c6p/9i0/pTNGI8Ghc8syLnd31opEh3nJ9uPva6UXtIg=;
	b=mxhTQpbN/p74s2aBWnNXuFqQBi/1vHoGbeD2/fzMVJXycjIylpTG53LeYT7s3mW0yXUN
	 CaEffMnoBzfcby/ihK0m4g/mQFyXR3tXsFFk6n146W/lj/3U6bhtJgq/5rVHAgpY2b2qn
	 HOW+TW0IiQNIKf4AoL80VdXiCoEAbjEbsIZf6FTrR/1AI/0C/4Ict0zGYeTXhKPmvc8CD
	 j91g+6CzDesqLTBx/w9NWOPVps8CrkwEhdK/fwA7yFWSgRWgzgRKezxyoJHSVsmlkKoOZ
	 qViiB/xT0sBVOfSjvyBSuLkg3dx2n2psDqKTrrSiuKcS5baFPjv0Ccf+kzCywZ1iB7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=jelPMnnK;
	arc=none smtp.remote-ip=46.105.56.78
Received: from 9.mo576.mail-out.ovh.net (9.mo576.mail-out.ovh.net [46.105.56.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3EB6606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 10:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3EB6606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=jelPMnnK
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.43.237])
	by mo576.mail-out.ovh.net (Postfix) with ESMTP id 4jY2xC35Hpz5xld
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 10:58:39 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-n2gw4 (unknown [10.110.168.167])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 7532AC0050;
	Mon, 23 Nov 2026 10:58:38 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.97])
	by ghost-submission-7ccd8bbbb6-n2gw4 with ESMTPSA
	id ObWlFF4cBGvNugsAptLdCg
	(envelope-from <filip.golas@3mdeb.com>); Mon, 23 Nov 2026 10:58:38 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-97G002161d21f4-80ae-4eb5-981b-86ab5c99e349,
                    0A512C1CF0928FB71961449F2A077E304137B0E5) smtp.auth=filip.golas@3mdeb.com
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
Subject: [PATCH v2 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Mon, 23 Nov 2026 11:58:18 +0100
Message-ID: <20261123105821.305527-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 2044352756430925807
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTEcXCD0WMGekwarlPUTxJbaLiCgiu6ZcqiTtYXXhenNRs9ubbmOwMWLdtllEtPw40n8gRlmODHr1CXEpJIKYCa9rieL6o3r0qfdsQgP7yGL4RdPBeFEWs8DYAeXGds0xEy1e3e6nrFQXdT0uN8RJhtzbMlTwz8MRvZ+lMhabmhRpUnqveqEEsijUgxcNucrf4hL40POH72FZ9Kn1XK23M6/J9o0XypacseJFbgv/mDEKsMitURfzeGyh0/ztU8pJz4ejfsHYONoZbTlqYFK0/IVRuN/Zhpd76eadLaWZZB/yRKKTLwPRQk+HCGvT5FgNUfs3idsAazTjLlq4FDgoxrUfdZum4gZk9mmT+R1D4Cnxl6FSDlVBrsqSjsFvT1AuQkU0YrJhZSE3lhfeNSkqJW+cs2wRxHk94pt2T7y8u7vnz/g8yz/aKBBZ9NaK25KOe/ZsmI6M7ESDJfWcuAB7qo0TT7uZ6t70U85ElcpGOTX1V8hrbk5xLd5GXGrRZAZG9G0UirxDceAdGqEG15rd+LIAHjInnxi9efiB+iw5CBtz1/4YsoyKzN9nQN2DvslruyYVoJ0+k5GmN+7Ual0plhhw2XjSt5jp6Y4G90DBluGMYsjyHnnCa2k42yKN7YG6WPCFBwxDc+2xMPIU4A0Eydqd4/0bTL8HO5XytURYfdGSw
DKIM-Signature: a=rsa-sha256; bh=c6p/9i0/pTNGI8Ghc8syLnd31opEh3nJ9uPva6UXtIg=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795431519; v=1;
 b=jelPMnnKEX2OAxdmuGp5ruHBsCXeAkskAdaWjkDzZxnkfwjuUqjCApYV555KZ2fibtwbLjmp
 ri6tmY3oVGVx+DyN/gp87MxHQZ/duMCEMK5v5WhIbAVvggDNA/u3KXB8Dq88Jg61oEQU+F3hVZf
 jCP8cwED+IAVxOj7nMjOOKmT8QgSSyr2Ou/sgmtQ2gR9rv2RzIj9DxmYv25+bWZAxDrsbtS9esz
 Appzkq0pLdOPGpTi398PqbdcyTl2Fdg+mIeAFYRteF6VxXEG7Y6ZFsuOMT3pI0MSXRHYCQH9zZ1
 x0yIsnmJNESed5XCRAmS8Pc0pa4W2IFbuL1WgWuJb6FAA==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Link to v1: https://lore.kernel.org/platform-driver-x86/20261113074347.2301465-1-filip.golas@3mdeb.com/

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 372 +++++++++++++++++++++++++---
 1 file changed, 334 insertions(+), 38 deletions(-)

-- 
2.56.0

