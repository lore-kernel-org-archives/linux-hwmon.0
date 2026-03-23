Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3B6638B7B4
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 10:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774261521; cv=none; b=t/4AYQzPOP/yBc+EnS9lHTqyJUxTg4CArtinTVDKUJH7qyQ8pERHSghxPrTIus+OsHK77vS1ZuLYLXSGi3mhx9QkJpeo3tJDEAyeP+CGD6anuHtMJn0DOaFp+LNtyvx6QqrWG9Nt+c//dTDUyuq/X4gGAaRgXu+RB6IfXR0X/JI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774261521; c=relaxed/simple;
	bh=iGYlK8VA982bOh30WCi9J/1LDXbTzcCpDo+7QxPTigc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pvAI03acT0CLUFMtWWVtymISdFno4eALE6wVaEAY+HqE2pKu4IwKo+1REh8tNXLYp7PhykSH9vXO2P7fl7QOhFev2HxIEaPjfNcF8lkfQBLkhFJa3j9MpOVdPqtXIcw4Tr3HP3EVt5ke9QryAwz0f6dadEQ8qbsz57ORoMNKvWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=dD+HfIQC; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="dD+HfIQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1774261518; x=1774866318; i=w_armin@gmx.de;
	bh=iGYlK8VA982bOh30WCi9J/1LDXbTzcCpDo+7QxPTigc=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=dD+HfIQCKJwhC1PdpJ20trzhdS0Pml96XbHz9sr5Ra9JZQ9N++8FHk5XxElDR2lr
	 Rv3TD2x6zqtwnWEmlkcO3eI1r3Mb4zKe8xVlHp4GGasAQYpBPzGNeVt85jCkvUwqz
	 roHCLf2Ni4QRRhCXil9kaSzQkdOp6E2ZD9BUfrRYDo7Tm4AmOnQkBcU06aBCKN5lw
	 nneikkBEgYCqfyysFFauxVFyK9vuX2OM57fyWmq7jYmdBY12sJZjKDeJG6T3MWzGz
	 S3IfpGQ4Alv8fUMwFJ0OFnHkhku0v7efngquvzZzYMCPMlNMXgSjvLBGze2ihk+7g
	 WfB94ZIvV5xNnzHJSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MkYXs-1viFYR3hba-00bUSS; Mon, 23
 Mar 2026 11:25:17 +0100
Message-ID: <4fae6a9b-fb16-4429-b74f-e46885f8d32d@gmx.de>
Date: Mon, 23 Mar 2026 11:25:16 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Weird Dell SMM bug since 6.18
To: Guy Boldon <gb@guyboldon.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-hwmon@vger.kernel.org
Cc: jan.claussen10@web.de
References: <b476fdf2-1ce6-46ca-8c98-13e0ae1613b3@web.de>
 <97b6c751-0115-4d00-b212-352f37e5914d@roeck-us.net>
 <DH1W16PFES8U.3MBLJIJPV48JQ@web.de>
 <f9bcdb69-6ad7-409a-afc3-bb5f277ef0ba@gmx.de>
 <02d1330f-1439-4291-bbb2-289122eedd7c@roeck-us.net>
 <DH4H9QQI4OQ9.30PQ935ZJERT0@web.de>
 <62d86acf-6a3f-4bb2-9d81-cf47bd1461e9@roeck-us.net>
 <fd277150-af4b-4bd5-af7e-868c9678eb1e@gmx.de>
 <20260319094944.239871-1-gb@guyboldon.com>
 <c25f34cb-6069-42c4-a7af-bca27c6a411f@roeck-us.net>
 <DH98GAR01T3A.2T18C7CAX3Q0Q@guyboldon.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <DH98GAR01T3A.2T18C7CAX3Q0Q@guyboldon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:6/cQDO8sk+ABh+p48uGaHg0i0w5dAkIJgZgonSy8ZK21RzZaXDR
 2Cuw41D++xO4lMvYnJEjp8EY6TuqaFAmI8dAGQ0te3q8RtZGbZ4upYOrWmP00aotXIECFJI
 Glora9y90ZwKVFgiVPbYNyaylHwISqdUm274rnhFOtzpJbYczGYpQ0LgYiYTNO0bhtt6ED0
 jVjNUSKg9/f/7OpU3tReg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:oIAO/4ZaW/s=;9vusvC4EwrbALGlms1ZOVebf/0q
 3x1YmfaL0Ra0dsxgh8ym09q7ZGlzLkgQN2qtBWZxYsN8EBP0MQYwA6uGd8t4P+mPxBBH+LAVm
 58Cx+JmUPXQRFczq2aGM+KWNLPjKZS/ag2tZCtdGcrHMbra2jLbe+VE7yy6/7Emxj0BEuolvG
 PZlsyD70fezx6ta5d7OM+WAreRI+GdfYW4Q+usgnb0p6jewK6Ry9AuIRyDxaYus4oF/t4qbIy
 MDkUwjXJxW7WL7T8XONDkbIQMBdB4CVJhrB/23lUb3YRo7OxJunqigPLSb8BqLihFEeOFSZ9I
 L9Hi+tGBp1BQ5m5Q7g4HeF+5q7qVGhZF+XmCv9S4Cu1W96kzDjNfBEXfrJkQ71rxMd7xqUuh6
 aJJ7I3Ui7jh/0iamyNPFeTcErPOp1NkqdRR8bllWN6NRcY0mrmLJDKeWQFi6/WQwg/bpVE9sh
 azVALWn6ycRXQDFTvNDHxUA1dPmOiPhqNo9XaTSXzfai8bAkCjaXHygpQ2McL9NTFqn7onAhc
 mU+9GwMCulq8c5hDbMI6jUyjQH3MkrNtE4typkku6K7I5YtpF/9AY1aTzdzf2av19vNRVn/Gl
 sTk4oWdxJC9+JLPhcAYjonNo96NfEohBuuPnSMQz4tMNrJExoZwr4yoN8vpAYYs5r+ut+N29D
 qe9c38OKMcBWjAKTgyaADIlNJoo+tgEZFliRsQYLGMfN26cMFUsRAp/tKSmIJ8pdp/c/MDArq
 SyeJ7qxvEqvaTRKGQMWD6xDeoEdD1rFaUo9W+0qhW0olo1rPQ29/Rjw2z8YWl5UsuoDmsDaIq
 +WNjlKW+ZzY4bgPOZ2n2OAO48wD++KvDjz6dxKmYelirTV2r+7lNXK9W+gnap7e+nX/Om5y5J
 Z0BlAwJdQDiJzOisMJeWHMT2WEdO1km7BMTa2pQ69SQMMAv1sjc6DtlLxUpMbf7d7RbYjg9VK
 JddqJUGWATRiGEI83OtiO/gGF/53bdgBIMjuUTKm9yv1TRmf0+Ezm2iwPuCsS2FuYDvhNLM5q
 IhB0Dv2+sIMxseUSD7ZeddeWiDhbgoYSdqkTwn7Rgxv6o7yn3jwD2VJTFG+nyf1Lio7jdm6VV
 a9gEOjTB7IQFzrCsgoZd/08ytAyzIoKAXsX6gBH3AYUzpq3qdxcggaf+dbNwjxh0Nr2O3GQST
 JRV3dIw1Q9KHCgcRlRWbKXuvigFk0S7gDlJTk5wUs8CYYuI1KA1BJ62yF9rBR5mbCRCvBJO5D
 oLXqqXtHa21mnYV1+hmgKgd2uc/6v3vOhfe0Y7LA3Bm0Z2buCROUiWPJSDirh3zMgh+v3LeAP
 PgBT/9/BJnvzo5XkklZt6ZEUjaFoxc5sUD+opXcv4vVJKdfCuWFtcbiTUovaKhRe5oMg7X+CL
 OJsLj+bDtYa+0pj4M3SnkwXX3jCHmytBArRUg4pw4jlU7BiiX2vCQ39euvv7ma281o4EQ4oq1
 Eyxb63dUVFFU5SX9WhxCuR8h1KlGUP03kW29apcwzhPEyHej1aaU5TgNoR3Fgwdq5LwoAzN9P
 y/zO0aEOuKAweGxFkOJRXBJQ15/L4mh37ZiIJ9aZPse1FeIvoU3tmPx6CxSJTHsc06GBYY/Fo
 y+KVGJv/mH0vepyAyUDlqy7y1nVt5oWvfpkdPXY0FO3J2pqt59jXfsjj9MUOlWgipqiLXehK3
 yeeoDAdF4mGjVmiejMej8e3FIax0sCue2dxjUvflIRP8cdYaXk4J8bqhyVnTd6FoHgJaJICWh
 lbMF+q+E0PDODESihq5ca5P66aWZxMT9zzvW8LtvxziAdzUpy+T2h8HAxJo6auG+0FaEE5l2o
 DTEsTuDqOnTPUYlcWlhRKQByWMkAMZtf5DDp6Hk1msFubJjJVHX17RgBwBkRozjtINc3ZYmAi
 sdPV3L5srZlCl1ZE0c52YFMGM2Piq8pAzvhxr7ZJSuBnhv25yL3sZhDyd8SArNxRf6rF16eA9
 +drh+yS2V1In2AFxlNjtMop9F1JMmSPuoKMq8BPMaLqT3VxofbR9to2s+m3xWJf+Cj/aY1MBz
 +kgOBu2a7PFXXUtxQDnsNS0O91YocDVl2cUpznhdBOFNO0UyOKwACd7lIOjeLuOhOvxOuq2bh
 fmhVkeXK7kG2QOj5LzbUcFguYjgUWw6NyLxHM5O+IaxBVvdYoDEPHBQ3r2A3P50Mv2LwwsUUt
 9KVS7ytai41BwKMtBmiTioQmw0UYt7ybmrF/c5sJRbKstYkmwsz4Gwl8sWpdpNDaF2FqODFF3
 OnaZk63AcfrD6AtG9bgVAc2AIZX+jd4z+jRdrSrWRdO8HKB5Rxeek/+wANfs9ype32+T2QgJW
 XqfqOfEpfFpiu7IBsYqu1Bz1SVh5uqB9Yu0ZBakIpifpUlmTUWdp5iPFRdROlshx2Q33HPJID
 Nx0MQZQEcEBdvQgQsARqd9DdpJRT3xq9j66szP1Mo6NZ1F2z4SREN1b+viJO+P0U/fajZezww
 SQJzPIVNN60Dl21+Wd4Y9mtA9PqoOex37+6TRET/cFMzBAxheFrcX6mf9vcK62kxnIWGiKfGe
 Hjz76sBkqZgCyo1nw/xLu4k/Fn12RXa6ltFre+dW8dlNGtUQNYhjrMJha4iF31utTHRIm++2r
 PuhIsGv+lhoCJ/aTG+V7vMiuA62BYUOZHGa5eyH0p55kPQTeDLlIKQbukq0fN7bx0QKyHQZvn
 gDa2ujXeGqh+Qd5S5WyDCywVCbajt+Js7DdBCG4YZVfHrRISyxL9IE1mPfFYlDUXrxi6eqXec
 C/s+jY016HdJ1E4F+a7//KYZ9VlwH8k11qMIHcGblw7Nd5l6T5BbM24sfAgVoImeS6N62CH8z
 PLzrPyIJ6buHwhHAz+h/yq2yVgCPn+TPNBl261DVuX6I5T8644o+S7XgSNdavAxq7isjCRPSQ
 qsUtXsiGT6rUzVWxYF0AAKBoscO0h2gq0VqWB4Ch9S6qfNi5eEWjtunBtdAgoHzCDqcp6qab4
 qda313ybSpJplahF5tSo0ukg2KlVLHpB9z5P6kuQJmRJmihK7UUrlrfhjvYKHjsCrUYWQABjE
 eXEjDD0gudacA4h6k/PSLGJTiiltRK1Ct1ZdqXza3mTtrs/wj0VEpOLh1sPbOSpUQwxNg0khg
 w6ed5K/yRk3lfLlth2BFz82tZ8sw6yhtkoQffVP/3GABSfUmEg+ch2Q7GywGpyY2Yp2gtxtWr
 THN02PZoaAubO//RqAx1cATtw8WGoa6PBj+y2XBUVLIL4xN0TqWA/mh5L5ESah65aotlInB6y
 i2weYtJkE7Uru7WWJDyvhrOf4u04AOWqaY3hy60/c7lldVGiCfCGHXAaxZB0ySI3/C0+cgRfc
 xu9QKQV3AwOH7ym5+UrGlbE5OC35xcp9GbAd8dUbs7FaJjgEuNbhKvsfjC1JRdUs30dkk/4S/
 0YwOOgnqhUdN/Kp0hosaFU3RWX6BHDV8tSs5XWaM+mT5jBHEUqxcvBlbYAobe/rCCZY8WnDdF
 X0vZ9PcIgUgfDILtfADkhR86AZ0syLuFwXk/EzzH7kT2XCqj7BLrfbNOiI1sfHOB13aRnRJHX
 TCFtzX3RiGEIvyACcXYOnyPI0KOm0Mbk/vDBddadu40Xq9tpWyp9HtGio2vAa2Q1ZJIGzkIQU
 5lb7CP5OkH9kcPwctL3h9FCeiECvZa1NATsTQBELnYdcjZTMdrxu1geYCwUGetQu/fYaOCWDy
 wYZSBXAPsAQBzt4KH0MDDY4HYiJcd53h5waDOTniKv8KJxcdAROn9S5imwIF7xFy2l6CLt0iz
 MkO22o15UAZT02SIyx+mkj48Yson17xwRABe3hWjf2hWmP5rd3OcfZ9IExJdgvdKBKSKjUlVh
 LgLDv7VgInhZ3NL0H4CZ7Bpf4CeAKjmAMoXOc97EXpv3gLDm9CNj4DR0ql2u9zvTaQAAC0Yyk
 c1q7XL9ZHD65oRdgXHFVs6sWgpGxkO0bPcHd8MUJmtQhfT//5NTLNmhroGdMXF7c/AoP6ZirJ
 awKMEo/xiDtNLrRJ1bLapJytOxH4C/JBJ46XunaW+87fcns4P/dHgRtWN0F0PMpCJ/ILpKJkn
 gzGJPPbyQKPZkKqFE+xOljf26tbvXN2XAjOGNFHbC2a64jKoQq83TopOQj02NFvyV8Ww3uwBW
 EZNr13rlUbVpT0awpmWkbxA1FTpLCPZC3fB8Xy9vo0UMtlch+P5S+LN7swpN4hz5EMGpkW+0y
 +Sl08oiM7jsaMQTxbGy1qAS5DrdU5sJj0ZSljup6bNAJ/eEWS7if9jsNuI0khTJDkGht7W+EI
 d8wC2NqSH3NVqYIaXegsntHzot3W2dQ6Vj9/zPOCG5AIHZe+a/+RT3xlUptsoPLzdmE14w0tQ
 qxan3W6IAAg705Llt0vHGgbtqGOW9p5t/dL7oR4+J6clD8kbqHtgHeF7aCZcUG9JnLEIAqsnk
 2jrVOBktxEWg3qm4Oa/iljgNDzhWSDQmnI0rYx8tpX6BODq+ku90LmEOtCqC5Nz++M1oZPhE0
 0JrnWccP7jjCnz76t5af2DseqEF26Ah31xuBesOVpjCUGK3hOoGVkjCTaueFS1DpOc0+tAUZH
 e0Y29U8YbvCGIAwmPUApWk9GmEYeU+fXJrJFFeOJ3BKYCIu3+xgIb33n2/jdawqv7Ukn42za6
 UVo+JMIEJFpvQFBmdJBWQlxwIvWJbHKmLDlyxX4zzMLw/ls96HxxaO+olU4y50uu0Jii2JMzT
 kIBA8kUXqufw2FUmWoqaVeG3tDU/Hqkc8iWUKNdUUvNvA7Gd2hZAbmsfDLMXfpLdtM0JzfZFK
 e/YqYOA3S8bWId7PvzYUA2VyRtzHYWFf3Y7QcBf/HqPLTjSpDaelUB6cdBATPmNtbGIhXuxYU
 Pbpx14gNlVuLuYWc1stNvypRFaRGYwqIXlTNDA10R66XRcWq7hSq+fTbxshNO4YYKCyTZSLBv
 5kdizY5J9IkWdwlTcbIIKrUvb1mjNc/SeckvTbryI2XntiOpgMiktVK0MxWMkibugawkCMoAn
 BgbJOWr/Qo0ScGyOK86o6TWjXy9tzPAkYQubQ1LS3kjNkENsTUDp++oOknYJb6yKEdlj5eOKa
 3qBdqYrWu79BmPcp7UslRobzXQOB9Exdml7WBf4IWalOn6R2dfg3qEw/5vxBwA8uAlkD9yDNv
 NbmhvRmjM27E1RS5rIP0z+XylAcmXuJCfCXizGwhzz3EnJy1hjM5EybYZoaEX2xKOxCoBujCj
 oaX+fYph445vC/PctKIoZAyQjpF7G4QEh7iCGM6OpCcr11FS7goU/sktMKdHzZbdzpkyduy8=

Am 22.03.26 um 11:18 schrieb Guy Boldon:

> Hi Guenter,
>
> Thank you for the explanations, much appreciated.
>
>
> On Thu Mar 19, 2026 at 4:52 PM CET, Guenter Roeck wrote:
>> The use of -ENODATA in hwmon to report that a value is not available is
>> relatively new and isn't even fully documented in the sysfs ABI (admittedly
>> a major oversight). The major driver for its use is that it more accurately
>> reflects reality as reported by the "sensors" command if an attribute value
>> is not available (sensors reports "N/A" instead of an error message if it
>> gets an -ENODATA error).
> Ah, it seemed somewhat new and that makes sense. -ENODATA converts to
> a clean N/A without an error message. We will adjust to handle -ENODATA
> going forward.

Nice, sounds like a good plan to me.

Thanks,
Armin Wolf

>>> As a related point: gpd_fan returns -EOPNOTSUPP rather than -ENODATA
>>> when in auto mode, and documents that behavior in the kernel docs. The
>> Please feel free to submit a patch to fix that.
> I'll submit a patch for that.
>
>> The best we can do is to find a means to improve consistency, but as you
>> can see here even that is difficult because different people will have
>> different opinions on how that consistency should look like. Error response
>> will vary, as will attribute visibility.
>>
>> If you would like to get actively involved, please feel free to submit patches
>> improving the documentation (Documentation/hwmon/sysfs-interface.rst,
>> Documentation/ABI/testing/sysfs-class-hwmon, and or driver specific
>> documentation) as well as driver patches to help improve consistency across
>> drivers.
> I agree and I would like to help improve consistency for the interface. I'll
> look at the docs as well. CoolerControl is a direct consumer of this interface
> across a large range of drivers, but improving consistency, I think, benefits
> anyone interacting with more than a handful of drivers.
>
> Thanks again,
> Guy
>
>
