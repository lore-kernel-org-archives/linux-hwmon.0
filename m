Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=115.124.21.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795566400;
	b=aHbrjAYgveRoLlG3kIor7qEY16bjp7OnJ8cKAw6XRCzsjo8BOqjJgulTHRtC26KL4ZvS
	 bvspTM3LkLDhd3/K7Q7U1BMrEBiPYWH/tlPJdzvA91ETSo+PWdpEm7pP1Oz89DOktkSp5
	 ZIb3XcKuU3Qb7QsF6BJ/LZ3QsJU7szcqC7MbAaT00ezq5u5K5GIdVCzpWqnkd071U9m6V
	 u5XTzhU/PBZQeMcdVc4go54/EJZg0izsPycNHhqI2gWg0Qa0dvmN3dRgBdCVf8+7hiA4i
	 RckWkCAz5m3Ffq1v+/ZRAVvIZSz5IhsGvV8FlXUxrbWMnC9v1QOGXKn1Eco94WKyVZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795566400;
	h=DMARC-Filter:X-AliDM-RcptTo:Feedback-ID:Received:X-EnvId:Date:From:
	 Reply-To:To:Message-ID:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=egIqSEZMUWl0Bhuz0KtGh85mbpQTM2vJSjbDRbWfKPc=;
	b=lg2cgNwhaR+WqrLdWtw1L+NXSdV2sqhdJA1E2hWr2cESbi9fySTOGT/dYTgiwRP8e1Td
	 07Vjx1+hs5+ZWg2ydM8AHwBjdfmW3o/S2FhlFufy++CYs77LNAm9rEU1q4lucmi8iWeJG
	 WrVOlT7TTob8nnw+9tXForFSn1t/z6z/fk0FB9RmDC8HXJnMZS7a3dEvhmG4Lx2MbbXf1
	 AbpgnWq5pS7D28QiRlu7XrTCNGa9ri7EyYRaD/nU5FgR+OuB4q8B7LsZLcFv/ZwzsxnyX
	 LO8WT9vWR5a8rrnM91qUFo1qdpLVj4eK88BZXwnRh1f7kKfzFc2Zz0BlG7Il8CIz6Kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=mail.wang.market;
	spf=pass smtp.mailfrom=mail.wang.market;
	arc=none smtp.remote-ip=115.124.21.131
Received: from out21-131.dm.aliyun.com (out21-131.dm.aliyun.com [115.124.21.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49BCB606A31E
	for <linux-hwmon@vger.kernel.org>; Wed, 25 Nov 2026 00:26:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49BCB606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=mail.wang.market
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.wang.market
X-AliDM-RcptTo: bGludXgtaHdtb25Admdlci5rZXJuZWwub3Jn
Feedback-ID: default:hezuo@mail.wang.market:alibabak_SmtpBatch:23154
Received: from 677b208b2007(mailfrom:hezuo@mail.wang.market fp:SMTPD_-VHcGbHXWJs cluster:AY35D)
          by smtpdm.aliyun.com(127.0.0.1);
          Wed, 25 Nov 2026 08:26:31 +0800
X-EnvId: 600000376385447301
Date: Wed, 25 Nov 2026 08:26:30 +0800 (CST)
From: hezuo@mail.wang.market
Reply-To: 921153866@qq.com
To: linux-hwmon@vger.kernel.org
Message-ID: <700499991.11156.1795566390834@677b208b2007>
Subject: Ideas about automatic promotion of ERPNext PostgreSQL compatible
 patches
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
Content-Transfer-Encoding: 7bit

Hello, erpnext-postgres-compat-patch, I noticed that the PostgreSQL compatibility patch project you released accurately solved the SQL compatibility problem of ERPNext in the Postgres environment. This is a real improvement in stability in actual deployment and deserves recognition.

 Our team has built an independently run AI promotion system that can automatically search the entire network for developers or enterprise users who are suitable for your type of project. After identifying potential users, introduce your project to them through automated communication links, helping high-quality open source results to be seen and used by more people. Many developers are very skilled, but often lack effective means of communication - this is what we have been doing for a long time.

 BizBot is free and can be used immediately after installation. You can directly search xnx3/bizbot in github to see it. If you're interested in learning how it can help you automatically discover and connect with developers who might use the project, I can send you a quick start guide.
