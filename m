Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=46.105.59.63
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769361;
	b=uZmkj2uhc6rF61fZLFDEt/+PIop9/6tI3O5kY0NewiC1UfbNQOGSap3qtLO4UIbF+0Nq
	 xiHxPf4A9D+75/hQPhfzHqRvTDGc08QxOK4LaHbH4sCWm0ogNFQ5yFVu+OTMqj7kVwWiW
	 8hJvtG859unT3zPq6Bh3mVYppvCyxK2oAUnbLNAYEpiQcZ+/pgtAkc94llKk0k5qZdUu6
	 dIdIuSgizBPYX3n1BGLZrn3IjMGugm4yjg+f/MRgTrzLKZEsIvPy9Gw8+hO+yFlQw2W4V
	 n1WURZRj74XBDKT8rNRUvQPiPfHYJzQPpjthWOhrLo++zjWRGLLOjaoacVLODIKt0cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769361;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
	b=kKUEJIpUf+Ov53+CyPL4pZrfjuafPGzQZ+jYfetSQPmA83CKXJ0Kz2Ess0CHDR3qgc4R
	 yhjI4NPJgChMrpnDgjPmIFnD+IhE+sxvJ67SeF4vkABQByzjd1QSOivAyyLydkuQMn8hj
	 lAVzs3OIyWE/HzkQ6/N19b8WItc88EFk0o1L6BhSHwXeKlE3khliG3uEehz8pFYoiE323
	 ajugX2AYpITrA9Vzn5enXD3IghBCfkBKGxtSQaYdK70w8G6W8Nwzx6t5aR1vMcduFrbWv
	 JGEernh9GbJfmpywxJ6TXTsNej+fcF8tyXoJ9j0dWfY18WbGMBfCe+dkkW16r8a6AeA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2;
	arc=none smtp.remote-ip=46.105.59.63
Received: from 4.mo575.mail-out.ovh.net (4.mo575.mail-out.ovh.net [46.105.59.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BC7606A6BA
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68BC7606A6BA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=NXqOf0Z2
Received: from director11.ghost.mail-out.ovh.net (unknown [10.110.58.102])
	by mo575.mail-out.ovh.net (Postfix) with ESMTP id 4jbRt125DGz6141
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:49:13 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-bntqx (unknown [10.110.113.124])
	by director11.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 4E30DC2A2E;
	Fri, 27 Nov 2026 08:49:12 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-bntqx with ESMTPSA
	id 3zMOCghECWtv1hQAXudyjw
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 08:49:12 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S0043b4fcad2-0187-42ff-8b59-53cbb559db0c,
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
Subject: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 09:49:07 +0100
Message-ID: <20261127084910.3355833-1-filip.golas@3mdeb.com>
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
x-ovh-tracer-id: 4902449670733361135
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTFlwNvaovJJRVjvhcHSWATnPcDv5bOG4ZNWC9xIb3yULCXL6wnIv1G3AM4j1xi56Ji6cOe17J8qqCQC8zz8Sd5VaSF9xEbtqP49oeBkrxuWinTKh6KmTNQ9elIrq8gGZ7qGKEAAJ3EU9rTZhMbAjq7yhoJCmiduxUzoRlu7HEFUGklyEaYMYOekK8Wb8tu5THQGoGlVjBAL99joysg7xZokkMbK3iGpXtKg7N/prTZjKTF5G2TMoHdz97xFYlKVBfTP86XSE810YYew7JA5oeq3znv7K7XwXx9HXKbZFMkKvA4A3P6tqzKUJTrgM23pO4fWoiuZx3B5QmvMcfLyMNKjRSWYIGlJhkrnR+e4s4nChU7VQx3F3YDm0UI1MiH0A18x5eLREAAhiU15rWyCIIKuLdKjjx053FtuebT7uuI5HDBzaEp2UeRflL9JX8usMiXfComJKnjpYFLbvVlM36opE6SSzRy5A5dkmZ67ug9I102ngGStk6U2OJQ1FWO9gGIz+dAsuBLtYaZMQevFwjy3ZtcX4WDNcwDThsd9hG7V11hqIhJJ9LZAm7DdvcNHUXyQt3pLhk2u/hUnhrO7CtFj6cax1STQ1prL0059mAepeTixw4M5QK8Q25m0bIf+Z0A2SHG6bhn5EVhKR1fNwafCy5W3XBNVRtuO+PsLNkH1ow
DKIM-Signature: a=rsa-sha256; bh=Qpg3+IyjjXZz8rn5Pmt07Gcef7W6fRnRi3A9mUqgmMM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795769353; v=1;
 b=NXqOf0Z2tPP4KviMZ/urBeTjGPTwQ8GLVD1HDQof+wzIkIdbrL0m0ry8ltQsRxMaoftOCYB2
 3qH+84ykqquiDYGvP7DcS92F8TceE0PBdNTPOCJ5EZY4pbv7TXoGN+BRiDtwOcKaJKdyDKOc8P6
 MZM5tpvgIhCpOoo9nL9zg4VOfM3axay9q/b5nmFjvhFWPDM7DnAlB06A7J4QW8UKEU0kJm2OO+P
 XbWg4QjMCxHtlSdi3oi3+4U9Erq6lwDChDpJGeEXEMeefi3UqJUN3nx8sxyXC3EXTYUjSJPuxi1
 ikOOGRWEWeSry1zDtEtECUZidcEE3HL1TKU7NH0xHAMGQ==

Add the capability to directly control fan PWM and configure the fan
curves. The initial version of the driver only supported monitoring
the fans.

Tested on a NovaCustom V560TU laptop with a pre-release
Dasharo firmware implementing the relevant methods.

Link to v1: https://lore.kernel.org/platform-driver-x86/20261113074347.2301465-1-filip.golas@3mdeb.com/
Link to v2: https://lore.kernel.org/platform-driver-x86/20261123105821.305527-4-filip.golas@3mdeb.com/
Link to v3: https://lore.kernel.org/all/20261127074518.3244152-4-filip.golas@3mdeb.com/

Filip Gołaś (3):
  platform/x86: dasharo-acpi: Extract dasharo_call() from
    dasharo_read_channel()
  platform/x86: dasharo-acpi: Add fan mode and PWM write support
  platform/x86: dasharo-acpi: Add EC fan curve support

 drivers/platform/x86/dasharo-acpi.c | 413 +++++++++++++++++++++++++---
 1 file changed, 375 insertions(+), 38 deletions(-)

-- 
2.56.0

