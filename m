Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CC739FCB1;
	Wed, 10 Jun 2026 20:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781123780; cv=none; b=keA+k9VMa2EhWPtKuBJ0t/YXxJ6WKzva72YcKUyRfXxlE3uwxTz9dkOgr9GyyY7xwd+yBsedZQy3CHqr82wRh66RgvZpyKC6iniYYNY5zu1oKA9IL5RFFcmjaLVlePn+O8kkWB0uINsFibxc8ksUirwBS70KFgTPVzIxPQcfZoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781123780; c=relaxed/simple;
	bh=XAniaRdUycTELUW+FzQvgVN9Oaxj6R0sMNkFgs9C6+8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W78Kj9MLRQOLd/SkR4dLNR939uhY0A1+Y/aII8+rmzbKYGDbGHPkjKjHQo0OZQulAFN/mFY7q/Ta4dSixcB4AtXsuhlz7jtNfjiKUIl6AscxymsM41ZZoBHeDfhfjkFmD+86PMvEh7rhwJ2V653hx05mZ8skIz2jjfKsHi4LcFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=lTXTZOgM; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="lTXTZOgM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1781123777; x=1781728577; i=w_armin@gmx.de;
	bh=XAniaRdUycTELUW+FzQvgVN9Oaxj6R0sMNkFgs9C6+8=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=lTXTZOgMU9VhcYzLfiRpkTUOOS/2Sb7GsWLvZnXn/isG2OG3yQIHnIEYPy3Uh8Dy
	 VGkZl/pFJuyaq3XG8DcwwIRzEg4rVY5dNfKkS2zI9MCBCMquGS9O2nAAlR0hOO6pK
	 B4IpaqaVzgsY3rkprhVr9Nnrgf03a5p8A4EpEtu9nkjNGdHxr5Yd2wDsU26tkL2Z5
	 yJI00Rq6uehwAB0nTty303D7YvvT/CaRsqTti9bGV8aBTYNQqz2p0kDpdeZqCj/Mh
	 AuhZLBwSt2XLrOh9oiPUzwoJGT51Pd3g62Z5Go0JHEjyQiCQ87eDuut/BsCvwFAHw
	 ypVlSXLen+EzWGcXUg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MfpOd-1x8PJA0McD-00eonM; Wed, 10
 Jun 2026 22:36:17 +0200
Message-ID: <b8c40adf-a7f3-4121-92a3-474df5364bac@gmx.de>
Date: Wed, 10 Jun 2026 22:36:15 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (dell-smm) Add Dell Latitude 7530 to fan control
 whitelist
To: Guenter Roeck <linux@roeck-us.net>
Cc: pali@kernel.org, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260610180141.311503-1-W_Armin@gmx.de>
 <43b8b294-ceb8-4d30-9a6b-09aa836f7ff3@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <43b8b294-ceb8-4d30-9a6b-09aa836f7ff3@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:m420DT0cFCSXAwNINQ7OjeUl5D9qI+tZ9yNcM2X9BFC+MAjCIfA
 V7x9zMLvMjU/Yt/ScavakWMNrXw9rhgVtZho5VJsQGMzRiFrPGuuFPRUlYuJcY/t1pWGOHw
 7lD1tFZstgUMUpLLcziXk2zmF8kj0q5pVHzEAyx6jED93om6tCi4oi7I6gbRtNRadEG8QE2
 G0DSecHx+OpTEnE3i8I6w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:XDYk7iq0E6g=;yFK76yi5hBZKQrZ9iYL4WuqM3hQ
 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

Am 10.06.26 um 21:50 schrieb Guenter Roeck:

> On Wed, Jun 10, 2026 at 08:01:41PM +0200, Armin Wolf wrote:
>> A user reported that the Dell Latitude 7530 needs to be whitelisted
>> for the special SMM calls necessary for globally enabling/disabling
>> BIOS fan control.
>>
>> Closes: https://github.com/Wer-Wolf/i8kutils/issues/17
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> Acked-by: Pali Roh=C3=A1r <pali@kernel.org>
> Applied.
>
> Thanks,
> Guenter

Thank you :)

