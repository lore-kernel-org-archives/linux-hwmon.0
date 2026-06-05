Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A14F313A3F7
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Jun 2026 21:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780695233; cv=none; b=D/cmGy9GF+pb0TzK1fHgmESG1SzgJVWW+bNzY8rcWZF+BSDLc3uuPVE4x5JWKHRCfCJlngyrOUBnyP3+NYQPcaByL+DiySrW7+sNLZ42iVLJ264V8NO4OoyCAlc7Udctyh46SbktDUg+UuCMa1nPu+nfuAz6KBk7GysahraCpG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780695233; c=relaxed/simple;
	bh=srxoidQRERHZQdn9SICG3w9M3aZa9Xl7N+eE0c6ToBQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxB5xAMzjUQ/ihCPKg+TxY9l66cgWofWeMA5LnlE3+W4UUuUClMz1xo8tn1AXcMVW/9IBzy4RK/yBx5NfXtt2Kk7vp0Q/etOWKt1ucvfJRkeqyogro2dKJr3Tdc/dLsudb556jbKGf8h4OOvOecWHL3twku/GuRD5B81zH40ySg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=jQuHQfBg; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="jQuHQfBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1780695225; x=1781300025; i=w_armin@gmx.de;
	bh=WglVgm3z59Im0TBwOKzfC55nYhlie0N7obC9ak6wl+A=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=jQuHQfBgAi8PekyaMkURgQuEDRgl24NatSsWg+INvdbKsyr9jpsK6Z2J3L9ntEuE
	 08TcpCjdW9dYuPl3wkKe14ohHJto+3/wsnVKKJRgkm9J6IBPM7n+lENoUc2zaIkAa
	 5lDTch1gQAdSieLRKt2ofpalBWzxoSt8gDoUk8GDvnOjEkHZ5N1H2+cVKDwo5PBnk
	 XNf4NwspUrwEQgY2KVge5+Nt4lEW9CtcL3/dHH9mcWbic1kM2Tj8O7EHGiE2j1Rz1
	 g6BlywaVhMQ+omQ9X4QLHrmRpoEoWubKshPRCMwuc1pwPby4ra9YfYgOO+eWIhR9v
	 WOSNBu120jTiM/9B8w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M2O2W-1wYNap18CE-004T0N; Fri, 05
 Jun 2026 23:33:45 +0200
Message-ID: <5b8ce936-72aa-4843-bbe6-2d89b2479763@gmx.de>
Date: Fri, 5 Jun 2026 23:33:44 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/9] platform/x86: dell-smbios-wmi: Use new
 buffer-based WMI API
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
References: <20260605205937.530897-4-W_Armin@gmx.de>
 <20260605211346.53E9E1F00893@smtp.kernel.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <20260605211346.53E9E1F00893@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ogoqrJplBbqIXUczMLXBByLogwV+2jNUVH/7J9HFGgrFZFECeDI
 UxXuelBkx/uDuPh/M4qXun1Z+laBQELPkMOh4b3ukcGGCL+LllB02AvLiFZN3cgOHC6bqly
 ZsbM+JV4T4Hk2NNudl55gw80bIT+CjFlCp9Wrc6mserr3TmMZnRQxA82PolB3e8fd6ollra
 IPsavbxlU8J2K+KvILu3w==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:L9ONJCZ72KI=;cHPOMEVW8X7StbA1XXcyFeV2soT
 eb5Xi8edU2/mSwUxawk9szlz8/6IDU53E0NwledogYxD0HFxXLw2tMbWTKl0xotRaBbz4zn7D
 ZtbLP7RmV99jga/Vz5zcr8tk4oTLTxdvTB/zmcw5lPvd5at3DXZOhvVJFRdu6cbTkWhSQufFz
 brutgd38YOFd8GphgJC0vZ75OkN5u6krIRiv4jk46f6i9FTwQgwhL01Xc2m+yZD57AUp+70V3
 dHrpzmotCUcJQAyKbHFaaiw97oG9i7+mpD55omOYA5F2trt71s/cacqjv8vO5uhJqnLN1KNeh
 +pkxcyITUK0qbXH8+xnl4c9orScWCkql4/E/63KpKaXulHNOJhD7/iJpr3oeYF3v/5zOpkc0r
 2Ut+0TCCZgZzh/6pC1vfxnCw7Bs4HWfwFmOdq9VAd+GwubGsrS6naghuU+zK5rsCUjcnmXa5+
 SD8n7UOFBPIjeKOjmmrD9ZE4Fd8/1y+oRyf5vWrkxEV5Y+DiUcLRL2bF3nq7LqiURqaVwIYA5
 4nL34DvECYs1ICU41/vy81QwR9HL1sFFq2xdxbEkKDk6/uXGdDjq2NOHy2lalNZKUHFkrZnBl
 rif+tFC4BNtwz94Tru+2MSH5t+Ai6bslL4EfJS05Tn1cra17HXiMM71+X35yRdqv5LpcwoBYC
 ZQuEmsbEssAB7/w9H5euskRq8lbp/5KBTRyJy1rxqohTH9/CA6/cZOqMqKWy9l1FW8osCsfhc
 UmQ39XR8CIrIsjzVMo9i99bKU07Sn8UfJChMHuCPIb7s4e8Uf6B0WLgxBZ4oN/ILSNsrAJ3+1
 NnRU0dL9ZNRylncO64s0LWiO6zWln4JQbqVAEWvF5FND/x24Eml8ShersGrIYFW+99nJdHJvC
 OsPELbwoJW/xkjEleZuID4Or2evB2X8CGzqjuU+9lTm5l8Cy2CaXTEJyCQ0tb5j+DVuFtM19B
 k7Eawf2/LAK9iiqQ187z9g23+HE2SGNw01i8bvWEkIuOhVBSHPB/dZkof25TtnCB8cdTM78il
 YOzxxmPvV2grOgJQd7jXBv9q7HPkOgy6UJ2d+KWP2K8QcUBBz9dRgi95pgnedY3/NSENsutTD
 KpvBYDCr0qffdhsb3MEUEkAd+8utkxWXDVIxbB3XHqHbtr98pBc0fkZ6WFSwfIbLSlL+XvesH
 BgHa/4nAdKLs+v8q67uwOmRuw3S8tB+HMjlf38WHkQY6rj48HeKn0cxC9H52ilAlTsbgFLP37
 vYRrEeJ5rEzZ0HFm4V6EaMNK2XO4JtDTzif56ZlcxgmN8cwTmoQbKNc1QrJrNuWKI2MpSRZQY
 taz9c0aCiLI4nbAjkyUw+tB4VRTWro7MygmNDurdmD99OiRa0eEEiPo59+GfxFlccvCk+ogkr
 TlD50mXK7TeO81RrfLXaiVBqV2cq9+OSThKWUqj3cNKQXi9Ee/OD5gLc4nAmRKNl97AAxJ4TP
 L9BUfRfliB83Q2nkhppzMQh/7QL1ErgKhkCs/DdhovxDdeGTxN2wPkAVJrrXsA9eiRtMQoB5s
 ImxAQzOQ4Oy85tUQA+vEwPOewexaPNwE+wptAf4WsNVhcSbY3DEssuMdbrZRjxa7J9ebZRXeR
 Ze8bEChpZ0r7yqSGTDdPkZu4XC5j+ZPUtetbVI85q7+NFOhrQsfqd2ozf3aTJjDSb5TlaMQwE
 BHc2b7FrAgkmhliJ6mtccL83SbPGPQYILNyHG6n7GNfTGAKSk/GOMeWxMwSsEHfvm5i/tbupm
 KGn2IeOmpo5+ZGiXGb4uPQcndEKWJfAPFoMap7xK4ZA6FJY3QzLIWMKOAZapah7h34hiqpYH4
 A+apDcUVblP7UKurCeJn8WFnwMUayecjidm0r/40VTGojTmFS/uOCfmCHMCk0+TVHSU1zV/3D
 fzhJscI/CIyS3E/wyYQyLtRie2yuJE1wGre4YdFoJhKBQD3BcG7/twbKIVyERR7wgVQmpn7/C
 6IjDia+yofypF8a5UsBQBOnLgR6wqR2qprArjhKtcZdc+AhdjD9hFJyolRl+SPeiqweMpf1PM
 DwUwL96lRl0mcAZISVvOFsp1RS+uBPp1UByc3F9Tn1sGR1Wey8gZIQUZJjw1GwHBPutncdS/i
 62ojmvEmjv1QAs0UZPEkaPc8G1wu/GdgPAALtofHtT7rlFT/xU7gnTF4YJ3JKv8Eqvp4WtRv4
 VkJfF1KrAh5n75F9nxq3UvawKWPVTkXHP1icrmF9WjgScvImHLyFgP6i2EWNLxiNhk+S8NUsE
 QTYFX36F49EF3bYobTPfclcg440Efd6cLY2GZIPnHkr9oGAcMxwiCPiOPhtF8pDEbDoO7yk2Z
 +mbOqO8MkgwW2x9uY7FRFir8YDJ0ZQtDztQKoqeWCA9EelG1wi22iXRSMqCnZHlf4pENWKQQX
 nrb9IJCsaWuVcNADinAI63ipAlpgEUfso+TYNJQjqH2halRY+n5a1inWi2u8YrZHpjPyukd9z
 1cJ+R9xzCFIjkckFolrFdESblb7FQfqHDkdhLn7rc57qKQGqglA24okJWgONw4gUW1jv53CuP
 2rNygZJ2GSDiOiL4tn2ZeMlJ1DqoslDFXCNirfOt7TK4pdxKR3y8JExA+Y71lOvcvGuILKz1M
 vHrVo9WCX2Z0gjh5ixBcutnROLPUmcm/1Y4/hS1X10S9S3+RRVRe4jnU7nuzf7mg4z5jpOlWw
 e6zavCcarvysNB/zZEVxi8+Dd2RVO+9/C+Wgra/rknz1o/t5Q6KZrmlId2l3BN/x82p8ZOvQK
 5fsfeOmlR0+ZlM8fXMd0JLCIUybNBYjUqC1x4iY13T2bbEZQvqQNFoZSbc+pKyBSMB5jXQefB
 whTXcS0MeWxEoLuyEqARl5ADcyWipHGo8W31SwqCyXQOocnud3Lbo1McMfBTM8VsxnAkJFDQ8
 TW7cFPdHcD+SOzsoHUgyF2WjE8Eo6O26ZeHazEeekME0mLN+BtWWhnQQiUBQVZIUf+2EmAv7F
 50/o80F82xWhNsccgipOOvniO25Qg8YeANdaw7VZaz8JFi4IDVJfuCZQPX0pmvuuJoJyY+9eJ
 b0/Ff60ICWPC2DFhk/i12wBOVcTbxAMbmnu04dyExxjQ0bOedH4aJJC3EFs5p57gdu7wpLFQV
 U9hW7CpotjCHAUJY9+Dz9p+Kx4Xv3veH6FVJ/NxcjBC/MpFTkYreR14kfy26YpX76BvDi1yFq
 3sVojnynv7169CfW64UQvCLMHHQUqdXD3SdCZAwsGh+d4WY9w8dnErHen7A8Gnaq1SdKstISX
 PShFSqme0bkN143yk1Lg40SXqmU4wcNPeqauhHca/BKdKmfWalcFq+m8orzYFCCBZE1fpLsIo
 7Wg5SCd7+9lJpYjwsJi9zk4+Rt7wSYDy3N0jVfKXCCZ17fu1pN5hFBPyLwgAt6ofU954Y4Ssx
 N96B3KEUB8Q34xqubT6tJ2QA5woeG3LHPdhrePC2Uf3SZ9Dh090EbvspRIkhYNy05C2s+FLgB
 18zCT/E4d+KYSOKaF/PuIARO3POuSTLQgraDEcP1/7uAckTJTys294YNJWkbvwFPeErLjLsrM
 pAK3WAbTl/7fQ6PSpb41Ay4HhuAfHzb2PR/b/zUJvaXuwEk6aWeme3ceQZ3wUQ6pisDzJhHmJ
 4HC/JmZ408eQQEGKPCsyFKIzeDOhdxJbg+mwoMTr4kMg+R5B+fJwF/sSpUrn/XaFekqtG+f4+
 rSOfVhVtX0SQhZ6L0XZCiCDNaG0errbb/1hTXCJFOMP06jAY7WfYKbdCYZ6UexelPgS9TK0xl
 t0y1NR24iDxPS3K15d7DVJdVP/mLkasma5Oos6ACfH2IjjuRAwwO2RgAeNhak6UJW8DUWR/uq
 vbsUT136eB+I6pzoInKz2vdGtqwdBuB28WmLAu5C1Ppa2fMedExa+WvU+PmDbqNQGso2rYZ6u
 8wcNr2oNUXXbWhRBf4fMaWos2YHr4otq/fkreHEuVYT3jFS/q8wpxVJ34XtPn7uLRSJafIncO
 tVLUEPh8x9wDZ6RGNNrihGqwxJ7LXcXhCWzjJ1b9ySwvWBZfNv/2u7tW7wwU+vJTxDLSarc9b
 y+dhwBR5v3zdtxvJHmjaKgBXHWZcpapmdBhJYMqdFgyu8OD2Xkg7c5JG01hjwDPeAaX0jUm4u
 JgogBlUNONg1DN1qZ/CM/nDoPMCsQZPW/MM2HKiAEcsglGMBjGdbUXX31RO51P6Qhjk0+R4bD
 v6qAP5rtB2nRp+rji4VZsgw4UBTjRxUpJCVf4VJnq74xdkKTgC5Q0bb4LWlODepu1vX8yDRkg
 jdq6m7FTpG8xCeHvyXPNX6g4m7uefJXdBlBMIuyIpuClJaF7E+/JylY2Zxc2Fd7Dr5j1Eme7t
 hrYLgkJeJTHJ0nalKq/3y8BCj0UtDzZJUyC24klfINpf8LqI38aYa8bMO49/eUu3B3elugvv5
 NgPhT1fRJt++elV5VQM+NaShVcSdP9Q4axus+EfZAskz4yaY1UB67Q5lVH7z8Tu3HojXYhf6s
 RRzss38oO9/rtkXgFvgrNW18LW67oeeSjQlETPjrFlQsKWc4z9Irp8f0hHZurnP3lCIfp2lcO
 WWvuYVZoCyX8mamHDreqee0DjypxG1KrCeMYRgxeLPGGXXw7ZfQNeBrslhj6DA9h7a88GN6Io
 VOsB/pro+v58wE2KFPQJXD6fVsnoRLZRSq4iLNfIbmJ7aE73uJCbvOjOvnONFjD6FJPThQB3z
 gt1I5uiwBkjNAKJE0ob7SPqu4QovnjMJXorMI8nNqe1V5vyw4+bEGQwX4y4MnNMZ1Mn/0g2B4
 fIsb31u8m8J99JQT/1xLcu8eKZRM+vtNqc9lMlKOF9qwtaxNVxH06D8fuaVa845wez6ULDQPD
 DaRDg+dXssdR4FXBdk0F56l2tPyitxezJvMvoDKLAO9ZpZXeA7ZvQKTjaHPe3T8g65yuHcqbT
 w5kEJuaA9wHy41Kjngw5DXNVMwyVzuj4lEn44u20isy1h30tEIl9m7leyhoOokhXZ7Ixdw3wA
 2zitKIROpFC4mNvGBDBTE6yVFxTYprAuGlnGpBvs1NEzeVU78BVyLAR8jHpwP6/hV80a8GFwS
 Oshdi0BjpK98U3u3bUv32OSEyN14UfY5zAAMH3yRvuaZfUbPnmzwOamg1qNMFLmi1S4qe4MXb
 ENFJIZIFJZYhnPBjR+0ejsUkeykee0AwDlPvLZFc6JuVluMgTIMdRCih1dLeXIurWoc+2dRhx
 3bSeAcG5LBZ4pPMkmu1IhaaKdLj4BgQVzLG3p/6V/ObkItcMxcuu/c+mIamgDF3s5poDUeQrW
 1m56SA17gPFUXyFMDH4ub/e6eO8de3z46Lc1Xpt1LrgY/JAlp0zbwTYlCkLPSqa8ZqcNhI5+o
 OEOBIWyYGz57yrcMhGJv+jdEUfEn1lDtQglKnztpjbvzw0NiDITrTvlsERHz63DXanbt9zuRR
 OLBA8UU4UsDv1Ey5dD1AO9jreFSKwNTcZtXprt2jFkkyRxNm4Z0nbFg1jZOiZjq0Tnv5iaj2v
 4fzaS+qL0LGBt33U9lKm9jU78A04e6nbJZK3rs8ZOyEkLR6r5pXWnfWgsE5/IaWqQG7j4Xswm
 YEgcbo/DQJSSeeZ6oGTx+iZbdHxzhM3z/XadV/SNujHn7O/JJyi7oF47P4B5Vz6LA0vPD2qgj
 UWYvjvesXsILCtI8Y/UrSacleg+A/hVQ4TMJsaR

Am 05.06.26 um 23:13 schrieb sashiko-bot@kernel.org:

> Thank you for your contribution! Sashiko AI review found 3 potential iss=
ue(s) to consider:
>
> New issues:
> - [Medium] The driver silently drops SMBIOS integer error codes and chan=
ges the returned error from `-EIO` to `-ENODATA`.
>
> Pre-existing issues:
> - [High] If the ACPI WMI method evaluates successfully but returns no ob=
ject, `wmidev_invoke_method` returns success (0) and sets `output.data` to=
 `ZERO_SIZE_PTR`. The `dell-smbios-wmi` driver then blindly dereferences i=
t in `memcpy` using `input.length` (which is > 0), causing an immediate ke=
rnel panic.
> - [High] User space open file descriptors can trigger a use-after-free o=
n `priv` and `priv->buf` after the WMI device unbinds.
> --
>
> commit 16e2a3995c7578613ee091087b9699433b85564f
> Author: Armin Wolf <W_Armin@gmx.de>
>
> platform/x86: dell-smbios-wmi: Use new buffer-based WMI API
>
> This commit updates the dell-smbios-wmi driver to use the new buffer-bas=
ed
> WMI API. It replaces manual ACPI buffer handling with wmidev_invoke_meth=
od()
> to better support various ACPI firmware implementations.
>
>> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/plat=
form/x86/dell/dell-smbios-wmi.c
>> index a7dca8c59d602..64d0871b706e5 100644
>> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
>> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
>> @@ -50,38 +50,32 @@ static inline struct wmi_smbios_priv *get_first_smb=
ios_priv(void)
>>  =20
>>   static int run_smbios_call(struct wmi_device *wdev)
>>   {
> [ ... ]
>
>> -	status =3D wmidev_evaluate_method(wdev, 0, 1, &input, &output);
>> -	if (ACPI_FAILURE(status))
>> -		return -EIO;
>> -	obj =3D (union acpi_object *)output.pointer;
>> -	if (obj->type !=3D ACPI_TYPE_BUFFER) {
>> -		dev_dbg(&wdev->dev, "received type: %d\n", obj->type);
>> -		if (obj->type =3D=3D ACPI_TYPE_INTEGER)
>> -			dev_dbg(&wdev->dev, "SMBIOS call failed: %llu\n",
>> -				obj->integer.value);
>> -		kfree(output.pointer);
>> -		return -EIO;
>> -	}
>> -	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
>> +	/*
>> +	 * The output buffer returned by the WMI method should have at least =
the size
>> +	 * of the input buffer.
>> +	 */
>> +	ret =3D wmidev_invoke_method(wdev, 0, 1, &input, &output, input.lengt=
h);
>> +	if (ret < 0)
>> +		return ret;
> [Severity: Medium]
> Will this change cause the driver to silently drop SMBIOS integer error =
codes?
>
> Previously, if the BIOS returned an integer error, the driver explicitly=
 logged
> "SMBIOS call failed: %llu" with the specific error code and returned -EI=
O.
>
> Now, wmidev_invoke_method() unmarshals the integer into a 4-byte buffer,
> fails the length < min_size check, and returns -ENODATA.
>
> Does this loss of precise error codes hinder debugging, and could the ch=
anged
> errno break userspace tools expecting -EIO?

I do not think that any user program relies on EIO in particular. I decide=
d to remove
the debug message because the WMI interface does not specify that an integ=
er is returned
in case of an error, so this is a implementation detail of the individual =
ACPI implementation.

Thanks,
Armin Wolf

>> +
>> +	memcpy(input.data, output.data, input.length);
> [Severity: High]
> This is a pre-existing issue, but can this memcpy() cause a kernel panic=
 if
> the WMI evaluation returns no object?
>
> If a buggy or malicious ACPI BIOS returns no object for the SMBIOS WMI m=
ethod:
>
> drivers/platform/wmi/core.c:wmidev_invoke_method() {
>      ...
>      if (!obj) {
>          out->length =3D 0;
>          out->data =3D ZERO_SIZE_PTR;
>          return 0;
>      }
>      ...
> }
>
> wmidev_invoke_method() will bypass the min_size check and return success=
.
>
> Since output.data is ZERO_SIZE_PTR and input.length is strictly positive=
,
> does this memcpy() directly dereference ZERO_SIZE_PTR and trigger a fata=
l
> page fault?
>
>> +	kfree(output.data);
> [Severity: High]
> This isn't a bug introduced by this patch, but is there a use-after-free
> vulnerability during driver unbind?
>
> The driver allocates resources using devm_kzalloc() and devm_get_free_pa=
ges()
> in dell_smbios_wmi_probe():
>
> drivers/platform/x86/dell/dell-smbios-wmi.c:dell_smbios_wmi_probe() {
>      ...
>      priv =3D devm_kzalloc(&wdev->dev, sizeof(struct wmi_smbios_priv), G=
FP_KERNEL);
>      ...
>      priv->buf =3D (void *)devm_get_free_pages(&wdev->dev, GFP_KERNEL, c=
ount);
>      ...
> }
>
> It uses devm_add_action_or_reset() to call misc_deregister(). While this
> removes the device node, it does not revoke existing open file descripto=
rs.
> During unbind, devres subsequently frees priv and priv->buf.
>
> If a user space application holds an open file descriptor, could a concu=
rrent
> or subsequent ioctl() access the freed structures here?
>
> drivers/platform/x86/dell/dell-smbios-wmi.c:dell_smbios_wmi_ioctl() {
>      struct wmi_smbios_priv *priv =3D filp->private_data;
>      ...
>      ret =3D dell_smbios_wmi_do_ioctl(priv, input);
>      ...
> }
>
