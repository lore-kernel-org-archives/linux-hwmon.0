Received: from mail-43102.protonmail.ch (mail-43102.protonmail.ch [185.70.43.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD4D39E194;
	Sat, 26 Sep 2026 21:36:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790458597; cv=none; b=Q7TuOtbQ98hho95J6ldt+tBHQ2MBjek35jYbdFeHGpD+Fjche3XHw+TgMS/rqxUstmu3sT3Exp0QGgmaXO8NxxWRYXmyVD+NgECage7aaNFija7NT5fQqKhGzuba3h/W8aQghblmJ75a1kXHRtWNmV5UV6KXkR/e3etXbjGX+lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790458597; c=relaxed/simple;
	bh=auEgms8zj/ONVnYleiE7FwrBDSqWLVHcx52Sls4ynqs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Pyx5Jza4GkE3S/K3TDUKhHVEyqGzmaSGkHkaxChj9jYbcqcQJKmyU9SZ9KD8Tbpb85OXM11nSCQmeEswqLtummbzYMocISl6QK0Wy8CqNWbf5XdZYMSMLqBlman1j0vxVHzQ9dSEgy5VA6/7nGwhUDv7KwqK7sPfTNfIh+HocyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=e3Vqssc1; arc=none smtp.client-ip=185.70.43.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="e3Vqssc1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1790458587; x=1790717787;
	bh=auEgms8zj/ONVnYleiE7FwrBDSqWLVHcx52Sls4ynqs=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=e3Vqssc1vA8W4rxWmqabOwMtV05Nud6r1hp+gkjlNJVhPxCaGZWWfh+U/yXIaBREd
	 BSh2cO7AAaQghDh/K5F6ENeI652ngOcarnbwubQYk4rTG9xA+BdU/hSVyi4vhrjAgx
	 82I7EHIgY7Q4W+LIIby14jkhs6dNI4KZxw5DYxEfsl+3fySQ1V+G3jB7WCAPsxXmR3
	 W+al/tfJSxcc+CN64ouqTKtSfwiBfL5bDoJBRXvTyb+jSIN0+mcp12pDmovD3way/R
	 jG2WwYrnK6EeC2WtuVWWtgVMCA8DwYcjK7J6FGNKLYGpIpEb7wpJYUGXlv3fkhpRq3
	 j5cXR4Im0bXVg==
Date: Sat, 26 Sep 2026 21:36:19 +0000
To: Antheas Kapenekakis <lkml@antheas.dev>
From: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Guenter Roeck <linux@roeck-us.net>, Cryolitia PukNgae <cryolitia@uniontech.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win 5
Message-ID: <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me>
In-Reply-To: <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me> <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me> <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
Feedback-ID: 211386292:user:proton
X-Pm-Message-ID: 888b4bc0f320a6af5fc7c104a4a9f76cf04d5355
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Sat, 26 Sept 2026 at 22:32, Antheas Kapenekakis <lkml@antheas.dev> wrote=
:
> in my view adding all these functions is unneeded complexity. There
> should be some simpler ternary way.

Ok, I'll inline them as ternaries in v3.

> Are you sure the correct number of fans are populated for each device
> because of the visible entry? If yes, it is fine for this hunk. If no,
> needs dynamic population for the struct in probe.

Yes. The hwmon core only creates the attributes for which is_visible()
returns non-zero. On the Win 5 both channels show up and work
independently. Loading the driver on it with gpd_fan_board=3Dwin_mini
works as expected: only fan1_input, pwm1 and pwm1_enable are created.

> You also add a board match for win5, but doesnt the duo have two fans?
[...]
> Verify which duo-like devices implement two fans, it should be all of
> them. I think Cryolitia has a Duo. Win Max 3 according to my GPD
> contact has a duo layout. Unfortunately, I have no users so no DMI. So
> it is at least Duo, Win Max 3, and Win5. Then make it so only these 3
> devices (which should need no separation) report two fans and two fan
> speeds throughout the driver.

Agreed. In v3 I'll drop the separate win5 board and give the duo board
data two channels instead, so the Duo and the Win 5 share it.

I don't have a Win Max 3, so I can't add its DMI string, but I'll add
the duo board data to gpd_module_drvdata, so gpd_fan_board=3Dduo can be
used on it until it has a DMI entry.

I only have a Win 5, so I can't verify the Duo. On the Win 5 the
second fan's RPM is at 0x0476/0x0477. Cryolitia, could you confirm
that the Duo uses the same register?

