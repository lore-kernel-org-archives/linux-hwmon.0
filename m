Received: from outgoing16.jnb.host-h.net (outgoing16.jnb.host-h.net [129.232.250.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A320725F781
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Feb 2025 11:58:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=129.232.250.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740743893; cv=none; b=gdtHde2Tfjy2XUyMigktY0jv3bgh/KicS83Y932WljRnkCgY7NNrY4Vak/VY8fVIZ+JjusieOHV1cNF9z6rF3r2VV/RlpaYslN4WxtUu2enNDG9nfRB5vHp0gXGDVoAkkUl0u383RtURWfZi7K4mb/IkuPJl5q/YUX43hheA5NY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740743893; c=relaxed/simple;
	bh=LnJAb5OtSiiPPpVmdSEicOxdfy335XXtHun9Lv2d8Bw=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=aHD+9wicon5YsK4QcCiT9rbtogCiQhrGx25i29nhRLTQs+6yMGY2+oYhdV/H73dsDPtlFmBafnLNUKPrCRCRm1atfA/qoeNXvJBWWIB3goXEh6RGo0B5Z/cCCSEmYByZM8bfD6M7xkj7ulhr8ZygPO3jEEPdRqn9bq6Qb0MK9KI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za; spf=fail smtp.mailfrom=coldcon.co.za; dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b=gT7GT0Cz; arc=none smtp.client-ip=129.232.250.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=coldcon.co.za
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=coldcon.co.za
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=coldcon.co.za header.i=@coldcon.co.za header.b="gT7GT0Cz"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=coldcon.co.za; s=xneelo; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:sender:cc:bcc:
	in-reply-to:references; bh=t+qwmUT3iOAm1DfPM+nbVN5TXLHXkSwi3Xte37fm8Y0=; b=gT
	7GT0CzSUxZTbbVPHJvWHABh6o/C2YxEfbvvI5RUmplDlmFfHTbeRYZH7TlyBmPOLD1AJ1d/3UeF8R
	n2JCcvt24JOwm9nyLuNGYj+K/9gd0TG4Xgsd4vtv2dIGAlct6h+NWeTXsESkQXRwH/ocD85Whxf3s
	hyRO5y13kz/lJ+JoukOc52cLkxlfS1jMOIg+3RV114RekNWRrEnupOqzCUVvlzyB1Gu9yl5/8vknO
	7g50LdO6C2RBb36c25KY3juOkbn7h9zVe3CeusxlqVdzlWSOrX7TSO5pgRVRq1MOoGC6g8tRmymSS
	ZnPWq6tA2Yo6oPqUAWE3NS4V8UzQeBZw==;
Received: from dedi166.jnb2.host-h.net ([41.203.16.166])
	by antispam4-jnb1.host-h.net with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnz0H-004dug-Rt
	for linux-hwmon@vger.kernel.org; Fri, 28 Feb 2025 13:58:07 +0200
Received: from [104.192.5.240] (helo=coldcon.co.za)
	by dedi166.jnb2.host-h.net with esmtpsa (TLS1.2:ECDHE_SECP521R1__RSA_SHA512__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <avaril@coldcon.co.za>)
	id 1tnz0G-00000006DqX-3zXB
	for linux-hwmon@vger.kernel.org;
	Fri, 28 Feb 2025 13:58:05 +0200
Reply-To: funding@investorstrustco.net
From: Iyke Nikolas <avaril@coldcon.co.za>
To: linux-hwmon@vger.kernel.org
Subject: Re: The Business Loan/financing.
Date: 28 Feb 2025 11:58:04 +0000
Message-ID: <20250228112431.0253DA89F653B4C7@coldcon.co.za>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Authenticated-Sender: avaril@coldcon.co.za
X-Virus-Scanned: Clear
X-SpamExperts-Domain: coldcon.co.za
X-SpamExperts-Username: 
Authentication-Results: host-h.net; auth=pass (login) smtp.auth=@coldcon.co.za
X-SpamExperts-Outgoing-Class: unsure
X-SpamExperts-Outgoing-Evidence: Combined (0.88)
X-Recommended-Action: accept
X-Filter-ID: Pt3MvcO5N4iKaDQ5O6lkdGlMVN6RH8bjRMzItlySaT+CzanhUpQxxY0jGcn2Rs0cPUtbdvnXkggZ
 3YnVId/Y5jcf0yeVQAvfjHznO7+bT5xtZajfZR3GQsTfNlEOo/bgO5jGBP+wEOrMwSAfHIYnNKvp
 k7Vp2UXVHEQMIct0liL+eMn/ACDqfKnzu2/TcYEDswKQDamPN66SYe4XX4xmgBU5OYS64UP6tL59
 SLfE+k7Q3sZpCfiGSRgTsNlEbg6K8Ua5TH/mXATlvzWGmcG4SIfxcIwpeN/AizL9fRuNyvNq7i40
 Cv3JVydIoq+DWRCNhQzEPyKAxN0e/oONNHpTVpx06IuyC+tcTGxdYh5dhAOrMIibkpY46HKySyiI
 2P6osIZXKmwzbGT4VvpTL0Eb54bT3EszvIbAbB2Zy01d/7IXjkdTeVZ2qGWx/wHRpX68r4IxYv5l
 flLxuCfTD3fIXh6unVAsSuKjOThhS934edKuqr0aikOvJA+DuzeF4b+ym3AhG426mliYkCHBZpOg
 oqc4uCQ1hIibn+MrIDYy2WBZvd1k7AMVUvw4r/dmrv4vMEE6KEyh19rc7LZU5nlp0w2QEetkvH00
 /xmn6oF5z8skuB4fLNdsm49znGEOwW1RyaT+fhnmPmZ+OUuV5BM6eyy5Vo6xOiF9lxkCbdmQZuQ+
 vQFrtGqZBQEiQhC8E0amZTmDiuInTF1nn44FsG7IfwXlAa/VV1ggY+YjClziYV+KHYcWWwiikDEw
 0L2tQ2Vz7QgdxtQsKWiN2eBEpDFg1VMP6t5qUNbkx/duvBFFEDWrf6mhLAJyf5HFv/CNAtfcbkrr
 XJdjvnK1Pf/En0f/a/vWH12qZK9jgS5VsMqaSNOYsI08JER8fzih6kejR4qiHfu8OQBn2E0GRi6C
 /N93Fal2rFu1wGqOfBufyw6YYHv1H/aAwarQpYDOYx/6JtUOePZJ1cLZcEz60L2+P1AbxHnFclhU
 Tx8cSXpvegfDpRm2UYC3nHd+F0bSxeRmZK2YK48zBUFiTBZlsVonx1/dsKYqMqJhMK7zo5npQAo6
 6E7yKxL56TB3QjzBRZUNmuZa
X-Report-Abuse-To: spam@antispamquarantine.host-h.net
X-Complaints-To: abuse@antispammaster.host-h.net

Hello,

Do you require capital financing or low interest loans to advance=20
your business projects or growth strategy? We can provide with=20
the needed investments for your business. 

Get back to me if interested?

Best regards,


Iyke Nikolas
Managing Partner
Investors Trust
