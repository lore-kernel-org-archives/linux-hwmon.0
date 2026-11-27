Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=87.98.174.144
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770148;
	b=ratWKlgv5oftdAuOUwEsauJylZ+liKaOdKTrNNVqq7CXcu3Wl93ENX3IgVKHkBp0/Y6U
	 61GJj9dCM/X0LzjX3a0mTY/LmHFfvYXFNugCArd79hgty0qeiJW7gHGNfFhXdQjl1Z9Hs
	 DadVyNCoYjOJkhRKsJNRX+J3v75D88BvWtPrUh3J94yXX2e7VdANBufY6JhRYrv1GOKpK
	 n8cKR+mdSM9oex6HMWaaveFjQjckUpGorZ58E18R5II6MMXo84b3/zRFupkRMnjZdTf3Q
	 drDk3GjKiIt8kLhT07/FGNHiKMYjgBlmFhvvxMbZeHQ2T+iX0w+J9+noj9Jghu7QMrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770148;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
	b=O4UCKCe7ISrQY9qQrPsqsed/uPcq9Pb6d5jnchL2t2+hTRkc14PUY9/vfuN2E1d6MNFG
	 SrIEcf5K+2FRoowkNcUWowA4ueamp2IDgj2FNK1fxGZ0/N5WCPVShuEDFP1D7Cw3z2yA8
	 khZQlpiuvklUUlG6F85dCNlIJQickctDf4Z22dCJ/lNtA9cfRSlKFBySUeao7AIDYojzr
	 KDZIoN3xnZW7+6sln29/eRpOHu3YxC9b2b0kL9RevE91cXVARROeiN8rHBF/lj1tRKxbJ
	 JU6woG/pRy4f3HupN/x9bujnNHph8nBJet5miVRIWFJbr5np/E0c2cLSbhWdgzB9aVA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj;
	arc=none smtp.remote-ip=87.98.174.144
Received: from 16.mo583.mail-out.ovh.net (16.mo583.mail-out.ovh.net [87.98.174.144])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9428D606A324
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:02:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9428D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=mNMbRpsj
Received: from director9.ghost.mail-out.ovh.net (unknown [10.109.231.19])
	by mo583.mail-out.ovh.net (Postfix) with ESMTP id 4jbS982PF4z6DCD
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:02:20 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-qgh79 (unknown [10.109.249.183])
	by director9.ghost.mail-out.ovh.net (Postfix) with ESMTPS id B17C181D82;
	Fri, 27 Nov 2026 09:02:19 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.114])
	by ghost-submission-7ccd8bbbb6-qgh79 with ESMTPSA
	id wBV3JBtHCWvG7hQA11hrdg
	(envelope-from <filip.golas@3mdeb.com>); Fri, 27 Nov 2026 09:02:19 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-114S0086ebe963c-11e6-4064-90d7-40b8bccae90e,
                    2D78F170DE5B25267C595F1CD7CE4558A7ADEF44) smtp.auth=filip.golas@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
To: michal.kopec@3mdeb.com
Cc: filip.golas@3mdeb.com,
	hansg@kernel.org,
	ilpo.jarvinen@linux.intel.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 3/3] platform/x86: dasharo-acpi: Add EC fan curve support
Date: Fri, 27 Nov 2026 10:02:17 +0100
Message-ID: <20261127090219.3366764-1-filip.golas@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
References: <20261126165506.2793034-1-michal.kopec@3mdeb.com>
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
x-ovh-tracer-id: 5123970479740088070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: dmFkZTEw93vh/MW617X4n+OPviiEoEjJ5vbM6ueRLkdQrJ5sQdcbNqyZfQG11kWFOc1q8xIttWgRS5Pd9T8hwoY4YDF0H3DVZLHvYENKlTyNfbO0jwKS5hyTvabZCz1qwYRXRKPD2mn/6hDzG9YF7U/vUy+ph2xwHRM9CB/CMP92faUKB2TOJvj9iuP+ScUlkgVDjzYrB7U63HVPNME3YtXk8dFb5hJMb2yr9Pt24Jh4kZJxWik5Hf+Ks0S3xHmiDOTXbUIf+tcBeUUAWOyUIppurnpppw0HNnsEuFZHLOSw9t/JAx/emOG0YEX5v6Jubb6ty1yP3RYYEO9qek+ysCQ5RQzNEr+SBQFAPAwO3m96zZJoMAkBY0xpPf7Xaj53mBnI13ZiPQpFHQiuC58P8TR1IdIThKQT8WCVNxd+W5YoiRpvc1KQMeah3ljFdoXVZmfAYNy0J9PLXzKiT8WoDgB4KZYQVBV8TLWdXqXNnXnXIZR3idyn49cNFIYBEm+iiKOBRPrOcQA6VPuGmpSrINdsQ3rYta2uFtkMIVl55oHuYosZ42ORMVtfOeQqk5fG85CYskD2vI+Qu+SWuc7LOfCkoDFf7jhOg89/x6CVAiJSZ05vmdQGLe1SFJUZlH/lRqogmpkAF6M3nyebVlumMGoHPCTnVW/ZVozMwNVXGYB31IjQYg
DKIM-Signature: a=rsa-sha256; bh=7CLOBYbNi1X6W8t+viisTSOz4Vl/AACkz0yRw2Y7JRU=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795770140; v=1;
 b=mNMbRpsj9J3U8fieD55axxz3YD74v7f+H91p08Nj5uMeigZRI5pK1JDkckS3MSaj54ZMlx4j
 HqazIVs9D7KKHU35RnxNGDQuKHPDvD69I0uvj+4iouXXTnH/cT4jNin6dc4vFgx8asD7Ss8EZXl
 aPhz299onHj6Rvwm0s1D9ZqlsnO4jMRQ14kSOpG1su/7/GTNPllXz8C7PKvpzslH02kU+BRbij+
 Z4exVkETWzIB9xUvlDwCN9itRScTNjHefTbIt0xzdlWeQcF34R4R7R7mpWehK6aMB7iJNne/HdT
 7eB5VlxfxaFoHNKbRagpVB+eeVYE9njsDn5UXTCY2c8Vg==

Hi Michał,

thanks for the review. I've addressed your comments in v3
followed by a v4 fixing some problems it introduced.

Link to v4: https://lore.kernel.org/all/20261127084910.3355833-1-filip.golas@3mdeb.com/

Thanks,
Filip
