Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EBD23DB633
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 20:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773691810; cv=none; b=BKDabJWAEaH6peKxWUilu4MuiH6MJP2o4BX/6zHiu1kuJfC2dzXlgaWirvfjyoUDZGcS8rQYxfoTIwBQl4fnN28Oag7dw1LEo9f4abJhkdmYgjOMwtacGqyKEILMwxRAXkW/MMansfA7oixk+TuRBsMfSrGXmzWLmGxrGaIDuLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773691810; c=relaxed/simple;
	bh=tJHaE74D51BITZ0KDZSyjYtkwdXYLvGDZEwVov8bKgc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=pj4m9T/pVbd/e4WFfl5AAtuW0PmEndD95WC8wG2We7XhiIQlG7BKmg/gb9zwCY7pI57EK8pk6KSbKY2hhX9zfIHEa5bS8ZPd7hfO4dBELUAS32/8HCKtlP1ALq9udM3dAuHp/bK3UAFTPn6i+5oSB9XAfdUCyaUGjw2eF7KryTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=qAt3Rmjp; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="qAt3Rmjp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773691806; x=1774296606; i=jan.claussen10@web.de;
	bh=tJHaE74D51BITZ0KDZSyjYtkwdXYLvGDZEwVov8bKgc=;
	h=X-UI-Sender-Class:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=qAt3RmjpBfPMW8ObDMT51g4aDEnjqjfvfmhohAo3m98lsgI6s6AHIReQUhRfC0Yf
	 PqZWeYxY9+vUq9Q6ZuMEnlVOE4+XB4z68UjdpyDfMmps6Qv2EgjBcQPsQbjOhvFiN
	 XC5+wsDtBRokjNmeTTTfOQfME2skkTah8oSG+wQgSsIW4lcagPofW0wdWZ+8bha7n
	 th7MtH07HiF+UtYDXYwKy3IRXLAeCHp3qXBdNIuIgLWWmK87mwXeA+27M8gBPfGKt
	 JpIKxWmxewUx9VJrLd+5Nm4D4SoEZNUJqbOoKUqa0XY6RB0JcyPOC1sKT5jrMoz2c
	 PdsOTf3W+L2046OWXg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M6HG8-1vvegI1CrQ-00BsAO; Mon, 16
 Mar 2026 21:10:06 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Mar 2026 21:10:05 +0100
Message-Id: <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
Cc: <linux-hwmon@vger.kernel.org>
Subject: Re: Weird Dell SMM bug since 6.18
From: =?utf-8?q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: "Guenter Roeck" <linux@roeck-us.net>, "Armin Wolf" <W_Armin@gmx.de>
X-Mailer: aerc 0.20.0
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
In-Reply-To: <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
X-Provags-ID: V03:K1:4QjCzIsO9GHjn4QAeWRW6stZ08tF+95aCQ7MHGc059B3It40nXr
 ukydiwkfUDVYsPPe/MApu+mfJnIs+Qlcu/Jz27FzI4+Cu4nUO95u/5aj+LZPdfGXHxqFWCe
 ygLRQcHCb137b8Mfi9bz4Nx/8gTU9Xni6T74gUAxjynLcdpbNQxPVLeL3DledytjIp44NAe
 FFood7mV1XHsjE/K/SRbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:7MjuWEc3uto=;mZagpIoVqIZX3v2jZXw3xsShnhu
 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

I notified the coolercontrol developers about this thread. Maybe he can
find a solution from userspace, but a solution in kernelspace is always
preferred of course.
