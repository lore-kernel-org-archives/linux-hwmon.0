Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794449970;
	b=4bIR/4OhQsLJXGtMTQLzNriAN9YekOoNN/o8bpPmZlK8QIc1KMaOMOW0dMb6B9g70alx
	 zR4bPKZahP8nTqo51Dh6exRATgN2S0nYUK79TNwxMbsLKbhx51PyF3FxA37AxhHjY3tEq
	 LmuSG5R6cvjw4O8H49+o+pITXliLbhJYbD+MfbQfQjbZIQXbLFsMZGOnB/zVPPZfDkYq8
	 yK3n/hT+sjV5rtDJNB/rT86PULexeffGJpmhvy1iMiaPNYv9Uro6kEwI76q3QnferQDWX
	 BXDagzt0yCJ1Jh9qdEhwgLj4Tbzu+hw/pD0ron2R7Py1jsm2dZmt2vpkxi2RmuunklQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794449970;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=FFsQPJVJZ3QK6s1WDbavA6XB4VmDnxG1egYldoP6tgs=;
	b=FpsN/eKc9cj2wqMBgad/7rogonUcgwLwfxVa5mcG1cO1ry+FnLRuHMeyzpCQM/eP/Kvo
	 7sZkm0st0Uu234N27U0YEwoe2I0pkrtlOFjOJaF/1d7mgSslPal3LvJJVvUlHgsbdHNcL
	 Kx5SUSZ3Vn1QWa6uAvTxu4P8nW17/OGSD95Ac+4AumFqxU7x1GGonbOLPmJxuG6EO0Vss
	 +wrVA7f9Wrcl29xCfg1aDgUxTVhQbkczDa4kHBMRKxZaq20O9iEH8TaX0IF9xXcTbpqNa
	 lYZ64Jt0VKXFNIA94oMICwCPFDfYS58rmynPTHKkVUpry2RiOaKM8qZQ8Cfcw9qLXAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XUQinqud;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CA128606A31C;
	Thu, 12 Nov 2026 02:19:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA128606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=XUQinqud
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=XUQinqudYntL1lKThpTgC5uFJDJtS0Y465R/fupSKz/KPhOLOMyDpXUhFn3Er9wWput7GfnZ0DO4L
	 bckHfrX/FUX1rd6pW8jrpwajrVpOTE5EKp32YXBEY04xfb1EAXvWt9QRJ3xPGNdkl3y82FPH53iXEW
	 2KMMMxGQUr61/TK4=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af52230259-7c4bc;
	Thu, 12 Nov 2026 10:19:28 +0800 (CST)
X-RM-TRANSID:2ee86af52230259-7c4bc
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr08-12008 (RichMail) with SMTP id 2ee86af5222f58d-ee8a3;
	Thu, 12 Nov 2026 10:19:28 +0800 (CST)
X-RM-TRANSID:2ee86af5222f58d-ee8a3
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: linux@roeck-us.net
Cc: ckeepax@opensource.cirrus.com,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	patches@opensource.cirrus.com,
	rf@opensource.cirrus.com,
	zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH] hwmon: (lochnagar) Avoid oversized shifts for zero readings
Date: Thu, 12 Nov 2026 10:19:27 +0800
Message-ID: <20261112021927.117588-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <e5d8ded0-eb5c-472a-8c4a-5e5175759e93@roeck-us.net>
References: <e5d8ded0-eb5c-472a-8c4a-5e5175759e93@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Guenter,

I understand your concerns. I apologize for resending these patches
without proper version numbers and changelogs, and for the extra review
work this caused.

I will stop resending this batch and respect your decision. Before any
future submissions, I will review the code and validation myself, make
sure I can explain the actual impact, and follow the submission rules.

Thank you and Charles for the time spent reviewing these patches.

Regards,
Zhu Jun


