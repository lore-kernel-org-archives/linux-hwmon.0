Received: from mout.web.de (mout.web.de [212.227.15.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E940034BA33
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Mar 2026 19:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.3
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773428775; cv=none; b=idr79PheZFimyuS9Pt4VPLXzvmdb1itiSxVpX1HVV75AIGxAexKfcmOXLOkzog5A9B5QJv7a43omu3fye3h1MK/Z/zY98hZaslOLQEpH+PWHz4/w9WGUmu9qzj0fj7nQOwUXXj1JRSqdjy3005ULhVgMX7mgCNJX+x92ahMSsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773428775; c=relaxed/simple;
	bh=rlfy9Js/DGMSPedGxcf2HRKYDdFbPQm1SqzIsm3yOLo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:From:To:
	 References:In-Reply-To; b=hkTG85YwgOqURvZiSTt2OowGFh9ltfGgLnjFus2Oa0LSkea1HUAmrKw2X6qPcVOBQJsJOLVGFrLtACyJwdb1eErhig6i4ivt3gxOWZgz2nX6imHXPkMxM7hVrNaiaiVnnlZ3nu3EKjsTGfz61dVfzdifUYEXvodABXSrmpfy1W8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b=S8FUv8iF; arc=none smtp.client-ip=212.227.15.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=jan.claussen10@web.de header.b="S8FUv8iF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1773428772; x=1774033572; i=jan.claussen10@web.de;
	bh=rlfy9Js/DGMSPedGxcf2HRKYDdFbPQm1SqzIsm3yOLo=;
	h=X-UI-Sender-Class:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:From:To:References:
	 In-Reply-To:cc:content-transfer-encoding:content-type:date:from:
	 message-id:mime-version:reply-to:subject:to;
	b=S8FUv8iFSo04ABm/WgnEP0khXBJzpNVI4jrPjBt7icfcant09Ct6Q6EUAKw3Y63K
	 PQqx5KqV+aCo5I0i7yLXnMaYdtZghnc+RVXU75X/3a0bVYi4kG1wTaf1AzJoF6OFg
	 DBBDmXpDoQ3/inuqRGJaH581hNRv75KNaxS3RAMsTtfO72py29gr3x+F7Sle6QZWE
	 YVOywZU84fNU6iHDq/jVF1nzHaFYzat+oQbtg02PkLCCocWhjylVDVPpT7lC0RDqV
	 1yk1+nbiKGTuGJvNcqEZFl6LFAPWo87FjzIIy84ch9pwAPaTlhIjMlEIl5GFe9CRm
	 Nb9RwT81NYF9yCOfnA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from client.hidden.invalid by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1M5j1q-1vzVHS0Cza-00BKAC; Fri, 13
 Mar 2026 20:06:12 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 13 Mar 2026 20:06:11 +0100
Message-Id: <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
Subject: Re: Weird Dell SMM bug since 6.18
From: =?utf-8?q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>
To: "Guenter Roeck" <linux@roeck-us.net>, =?utf-8?q?Jan_Clau=C3=9Fen?=
 <jan.claussen10@web.de>, <linux-hwmon@vger.kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
In-Reply-To: <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
X-Provags-ID: V03:K1:AOOmijwqOKQJyyn7l/Qzk1rL2l5ykkGSXfkTsZ6RHCVxibsfBsf
 kA9kw8eMWV61ejTrlIxrje7pR2ecsK+dvlM3JtzS7Jo/oAQkRV/SST6FLq0REmgpEYRGLne
 7HG6Fy8RsmEJMrwAtbZCS2oJh3NuG81VhMYFMb5lS6AFsnMaBzmVNwS3oKhXjeTGpdxHyFM
 G2ZRkpjW0nyTpoi/IpzbA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:qlVm6Ur+9rA=;husxwOXrm+Zad92Ry+N2hZKSW4g
 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

I was actually in a fixed state for some reason and everything worked. I th=
en tried to get back to the broken state and seems that echoing 2 into the =
pwmX_enable endpoints followed by reboot did the trick.

I then reverted the commits you suggested and it indeed fixed the issue. Wh=
at to do now? Should coolercontrol adjust its code to this change or the co=
mmit be get reverted upstream?

My two cents regarding cranking the fans up to max until the control softwa=
re kicks in: I think medium fan speed should be sufficent. I actually would=
 always default to BIOS control and make the control software in userspace =
responsible for setting pwmX_enable.

Regards,
Jan
