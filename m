Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC692459DC
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 01:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773710985; cv=none; b=V/+lBUcyMmvh1c3mfqYY+yZwRX+a9E/mxqoi5kGrdRPSjV+U8NRVxR9TomfwpOfMjk6G9eAa3BvHuSy5kyCE9ChHwTW8wpxiLBwTkmd9mc8SnVyjdp8ZiUw8CG4dSYj1l7flHbXuUSRXjvaiP9QqNdqq5oXO2vl8hjYve0otLXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773710985; c=relaxed/simple;
	bh=1fuBB/rSKXSiOl7U08jKL3rlhjzSALN2qGIkpEWvy9s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tlPKAxnyc8jjSh2kfwNVvWE4wjGzcsqKi4GIs46ObWjwIKKTzAoJz7H6Gd+2y21SITarAFpoZ27JMJ9CA9Shyta14dOSPbYgh6M9ZlAp4aiN15rmcFzi8yhlsayKWRDYI9DZLH6ABQg7oyJbmY7uxBjdw0Akv/1I8h7Mt01rDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=RFsglbZX; arc=none smtp.client-ip=212.227.17.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="RFsglbZX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1773710981; x=1774315781; i=w_armin@gmx.de;
	bh=1fuBB/rSKXSiOl7U08jKL3rlhjzSALN2qGIkpEWvy9s=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=RFsglbZXoIrVQB2dmbOAS59qeF9yyAPutEQlRxoS/TT5O7YSvyTwWjgJRDJvoFOY
	 3YSGLk//tnfJ8l7SKfzU3YVycIgwG8uzn1RgS5ec6vHYercou3GsFRQk9WekKM+3m
	 BUQqY+yghv4/AkjHdAKSukYr3oFfSQsQ40+/iQZwnjNT8lKlMRm77J5EFLTlnvCTJ
	 K/X6j2d8FaXmqS+TPFKBX3FtVArGALRs8GcXcPG14rKuiLjAGl5QJ4RVMQgVOP9O4
	 fDaQXXB79knbb8tt/oMArJUEogwb6/mItzH1LxUyQWwSdTICoVfnpFRMz9JA8vxmm
	 rLZxzrjZvVDNy8Fz7A==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MPokN-1wGQ1m0559-00RN3o; Tue, 17
 Mar 2026 02:29:41 +0100
Message-ID: <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
Date: Tue, 17 Mar 2026 02:29:39 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: Guenter Roeck <linux@roeck-us.net>, =?UTF-8?Q?Jan_Clau=C3=9Fen?=
 <jan.claussen10@web.de>
Cc: linux-hwmon@vger.kernel.org
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
 <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
 <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dwKTJzaH5sDtjeX+bpR4JOLVwGDMA4xwzHvZ2AYSVQd2iJzqafI
 JAAYAdq7YNp6T/khF7dOhYF8YJybhLIE/Nve/pPX0eThqs44tEj32/pclmTu8Byu357AeD9
 czQlgojrIvpLqkVADJuHENrw7sDt+MJkP3hXdU7a4cr5QV3t1DfKuyAajcolt5xmkcLpK/q
 vswv+FrM4CWvhg7IeakrA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:K48N47zQF54=;C5ukIG3iW6zB2BCEQyBYhM1ruyt
 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

Am 17.03.26 um 01:55 schrieb Guenter Roeck:

> On 3/16/26 13:10, Jan Clau=C3=9Fen wrote:
>> I notified the coolercontrol developers about this thread. Maybe he can
>> find a solution from userspace, but a solution in kernelspace is always
>> preferred of course.
>
> The information on=20
> https://gitlab.com/coolercontrol/coolercontrol/-/work_items/557
> seems to suggest that reading pwmX sometimes works and sometimes=20
> doesn't, which
> is a bit suspicious.
>
I suspect that the successful reads happen after the pwmX attribute has be=
en set manually
using "cat". The driver will enter manual fan control mode automatically i=
n such a case
to keep compatibility with legacy userspace applications.

> I would suggest to add some debugging code into the kernel to=20
> determine return
> values from i8k_get_fan_status() and the actual value of=20
> data->i8k_fan_max.
> It might be useful to add some dev_dbg() into dell_smm_read() so we=20
> can do this
> in the future without having to hack the kernel.
>
We already log the individual SMM calls, i can decode them if requested.

> The described condition sounds like the returned value is >=3D 3 and
> data->i8k_fan_max =3D=3D 2. I'd suggest to monitor the returned value ov=
er=20
> time
> and under varying load conditions to see if/how it changes on its own.
> Then set pwmX_enable to "1" and try again.
>
> Based on that we might be able to determine if i8k_get_fan_status()=3D=
=3D3
> means "turbo" fan speed or if it means "automatic fan control".
>
> Either case, overloading I8K_FAN_TURBO and I8K_FAN_AUTO _is_ quite=20
> fragile.
> I strongly suspect that Dell Latitude D520 (and any other system where
> I8K_FAN_TURBO means a fan speed and not automatic fan control) has a=20
> problem
> with the current code.
>
The overload is necessary because both fan states are reusing the same val=
ue :/
Devices like the D520 should not be affected by this because they already =
set
i8k_fan_max to I8K_FAN_TURBO. This disables the handling of I8K_FAN_AUTO.

Thanks,
Armin Wolf

> Thanks,
> Guenter
>
>
