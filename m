Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3965A1CD15
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Dec 2024 16:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733071595; cv=none; b=XlfkO4vV/YG0+TfTZ2kD0Vow835i7a0e0elBj10bnj4Tzun/zP3Ujt4OTk4F4DkbAswu3+YSixjUD1/exkTzIqYAOdhEHQ3JmEn6WtaCxIPCFylyr81JfVDCWhzCatLRGJVMMCL6W5ny8CkR7PQejK2JxlfwjCkgLUQImQViU1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733071595; c=relaxed/simple;
	bh=luzTE7mz+ZoiwJz5illro/BC9ZKswPZQAJOMEeVRuLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=twqtszGxma2sMM0wxYmSYXbOcOYxdy9Ee5nTQVsUJ4MhfTJOtLd1vzHlwpIT4Af2gWJsZ89TWzxxmRmBUkPbk/Ffkc54qRuNwME39gIEukBKln7TMgfHFoDducxypxNNIlz/3vUeH6we4fiuvc0noRBKpqgCQ1fU0x3hwS8kB/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Fq2blCkH; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Fq2blCkH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1733071588; x=1733676388; i=w_armin@gmx.de;
	bh=luzTE7mz+ZoiwJz5illro/BC9ZKswPZQAJOMEeVRuLg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=Fq2blCkHpRn9TRDzkM8mv1wC7XVNCwAOnhdzsYmwHg6i7a/2ZputEEaUGyQf2tcf
	 eRxTm3D9nPGx3UcM05P9OzKL1Y9pP4W9tHxByrlJUycbpMc0PCfUjvm5kHcIr6U/j
	 6UXefDA0DmfeHrMiBOVeYb9/VO6//VLSt1ptXCpXI8B+7J2jcn9rhhC0eQRVLn5nv
	 p9C/UuKNwvArGP76oEIc0pH0O97ZLGJITjgKCdlRSqJGilHw2zk6tmgtHp/sIzmb9
	 N57qyRkk+r/4IIM9GYeVxFNcsOAAgl/Kpz5GhBRrdNbVcYO/vjUBZ/HsJaFmK5isH
	 vQv4DmyM1XPs8dgkYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.14] ([141.30.226.119]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MAONX-1tPG0038LD-001JHd; Sun, 01
 Dec 2024 17:46:27 +0100
Message-ID: <06787c88-5f04-4ffe-bfde-829edcb553f9@gmx.de>
Date: Sun, 1 Dec 2024 17:46:26 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [Bug report] Regression in kernel 6.12.1 preventing asus_nb_wmi
 from loading
To: Edoardo Brogiolo <brogioloedoardo@gmail.com>, hdegoede@redhat.com,
 linux-hwmon@vger.kernel.org
References: <0bc76531-d88f-4288-8a3c-023dbe04dfb2@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <0bc76531-d88f-4288-8a3c-023dbe04dfb2@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fRBkQvYIY3WWHA+h2B1vYRJeirFadMl7u3OQjKBN+gptS5BsDrS
 BSpOXW+4OfLJmsXu7P7eYue7ctEoB4YK9P+f/Sxeuy5YyS/Pz7EiGEPfQxamysp31NKX+6J
 nRkpECkOI+hD26MZ61bX5xiseCuC3oiZQQ8IZ9ja0eZIcHoe3MKT6csSMzyqq2YEJ0vqCgU
 wZKkNKJ20mipLjtp7flCQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:LgNNWM1VGtk=;r3HD+N0F+0ZiMg9sFlPjxY9NikB
 6F/37uR4g4J5OM3M2Z/hxy62/Hjim18sxI9X1LzEA1jsKF8XoQ6f8GJLcDwyjwoPV9ESenuxS
 mhxuWKrlcVMk17SajnCB1YaDsayfcvBR1Pf66OzJGgHl3DGDvxLIdCNEl8n3KvWnaA8GpANP4
 3NZDORjtHZJ+Nmg30OBVmHYIf4ju1WWkmgIGjcMxwcjbRsswAf62MlcScbjKjN6eXiIAUVnqM
 M3DiSf3LpcJ7MNKGFmQqAY0jTJSJ7WDLI8UMLGP1e9UZyYf8LcS+VZ3UKhKwYf8UoTH7UXjB+
 /SmDiZFHRehT2xeVrz00EbRcCNvC1qXNwaJiT+RDSrzA0YPWoVcbaTwfN9is0gO+OMZjkg5XQ
 pyVU7N804CdTL0fQTEGSWI4CKmDrjb9X2RAzeYC2yPP1RoRY0R3iGqi+CKynlDuDzuidvyoTf
 W8Bo/cdgLJ7TVqOMo48TZaAOpzkhGejNLPPoC+EFaTNoZRN0NrGKuvvq4f7g/OF+BcZl6jlfS
 n2XzYJ+rmySP1hP4Bk+p6h1rORfpZsuEjKdRU8nN53jptptu+4KyrVgdxnqYiD3TuVDwNqM3p
 zvWFmJdrXgBtWw0BXCBcr+ObUWI3CePEEWRsSTY7y8B0uEZ0Y+oBfjBbTNoyVHr3O9M+ezHyx
 7z2zjSQupNSz2ePLTh8J8Qp9RpOrbzljuG6st1tmZXQlxX1HTitLdaYDCifwkagYbCrqy63G8
 CDBU+IXwZB6hmVF1J/PulGUKTc2ww9B/ZFemDVFObbZsDVMrjAVM3IYcMYW75YW4sgHX1ZI6D
 PfoJ7z+2HGhkLZ/JpUZtzguZ+xLv8/xDSQP05yTngLyF55V4+5rb51C4bpCm51IXoS+NMRF/S
 64SajbvRhayAB+NvY9NVLvYyRi+Jog/cBUNe6UuZQiix5IAcw7aVaNFenA46wUxRlnIX9U+wf
 YNPlf8zY9f7dPiABIlbGl4mcNC9PM69skiCEoaCuRE8QD9Q4NZ0VcqTW1P+YezMD1r+qtJn61
 rGfCSrWMFK3kIeprMzatBUiXvw7E3wPkGSBj+J2VP/wc5r5TVbN1/8ihV9bTdfh7ArjWmmbag
 EwNd8UQZyUR97u5Vdo29FdLm8xHApf

Am 01.12.24 um 11:40 schrieb Edoardo Brogiolo:

> Dear all,
>
> I hope this e-mail finds you well.
> I am writing to bring up an issue I have experienced since upgrading
> to the Linux kernel 6.12.1:
>
> I have been unable to set max battery charging, keyboard brightness,
> and actioning special keys (micmute, enable touchpad, etc.).
>
>
> With the help of the Archlinux devs
> (https://bbs.archlinux.org/viewtopic.php?id=3D301341), the issue was
> found to have been introduced by
>
> kernel patch b012170fed282151f7ba8988a347670c299f5ab3
> (https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/comm=
it/?id=3Db012170fed282151f7ba8988a347670c299f5ab3),
> leading to the kernel being unable to load=C2=A0 asus_nb_wmi.
>
>
> Reverting that patch fixes all of the aforementioned issues. Please
> see the Archlinux bbs thread for full logs and steps taken to identify
> said patch as the cause of the regression.
> While I do not possess the technical skills to help developing and
> implementing a fix, I would be keen to help out testing possible
> solutions on my hardware.
>
Interesting, can you share the output of "acpidump"? Can you also try the =
patch proposed in a similar bug report (https://bugzilla.kernel.org/show_b=
ug.cgi?id=3D219517)?

Thanks,
Armin Wolf

> Thank you, and kind regards,
>
>
> Edoardo Brogiolo
