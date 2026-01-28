Received: from mout.web.de (mout.web.de [212.227.15.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865B62DA75C;
	Wed, 28 Jan 2026 10:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769595857; cv=none; b=GZLXv/uCTtshLKKeE7K7AmjDHq+puQEEJvHlfmeOEK31Gn4JDa9dM5zxyxYkjWMLM6Oioqq7SKRVHY8ON9UaFroby4AWBNpBjQzbaYdLfH48GieNlApoetZp9ia/yEKgR94uWmAq2vGCxgn32ozYCLC5cDdNA/VwHGDI8pSvhPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769595857; c=relaxed/simple;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=jAljt+vOloh28zBZEq2qouu8lhFwSJ6ArspW8UqcSXkqIE0YR0v21tCSIM771SfKbrBjrhrp10HK2/zLc2j+7Lnj0Go5K+kPFMsrC/sbN1vMo6zHyhpjzZv843JMNl/bqdKnTA1qKPsEtGNV7Jc04tlMrrs7J6aiNpzssVe2xEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=QBf/LTJR; arc=none smtp.client-ip=212.227.15.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="QBf/LTJR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1769595839; x=1770200639; i=markus.elfring@web.de;
	bh=L8jFm9Y0nsEVid6mR7NBmM0Yyo6uoUC1/L80TzAmgqM=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=QBf/LTJRcyBiqU4Ul7RQB8QckspTfY8W7k0Apg0uB9GHwcH5d6adBbETBR+Y3/BB
	 eld9RYzvvawTZOScrtdU916rurUMGjyFTGFUML7o509yzYmwMEEBR2AmxJVSIPAIS
	 U/K7xJLY3qJJAhyo0lThObXN5SsQobsdS/IOqyaWghp4rwGy+TRgeRVXyx+O0ZVG0
	 D8mswdWJKk+sY5tankPF3qP0F//mFTanm1Qbt8aI0aoHHEQKPpsVsxj6vK7E6daLz
	 MR1t3QPBhlcPrPBLnLA65hsJuYVFF1HozirpVp3YWssFwV2vjDeToVD+uSFJx6YAn
	 bL9Ny0zbeedUlWciCw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.69.179]) by smtp.web.de (mrweb006
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N5ljL-1vnIbU2bIR-00v605; Wed, 28
 Jan 2026 11:23:59 +0100
Message-ID: <f248b40a-f29c-487f-b980-298885b03bc9@web.de>
Date: Wed, 28 Jan 2026 11:23:58 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chen Ni <nichen@iscas.ac.cn>, linux-hwmon@vger.kernel.org,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20260128072610.2476625-1-nichen@iscas.ac.cn>
Subject: Re: [PATCH] hwmon: (pwm-fan) Add missing check for
 device_property_read_u32_array
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20260128072610.2476625-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IBT3MNyp8jEuVBqi4UAf06yF6s7EqEbLbJu8vn2Qo1mFjB+AyUR
 irRZ5/NF7AJK6TFoSC0dTy+oTQZaPOLJrlqy+Uh0G1yiY2E8aTg63AV19gkdcHRvby1oIpo
 rtFNyfqAaMw8VRqQLSwk1vHDKjTom0S0MxCZjflRpnwqG+k980uFAxGYYIUCGgmH6EzJE3e
 4fEUtZ52NtVWS8JMvMLng==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:nrTHA5rrR+4=;DVQeUtAJiDMVF8nLeAZ7q5iYOUu
 JOXWwkyJrmQPLLWIWR/BZQqJTyqs/tDzGQbH6BNlCr2xNyzj80wijDhjT6y9FE5kFJXCxkzlD
 4oWqG8of0A0O+MQllwgSUlglBn5FFg74oWapM+328c8P6c4AjZc8bT8Hg/wioJiWm6IsJDueP
 enSfqFz/N+0c3C5aR8Gjt8DGlHfiz2vsh+eIwpr2kX5LH8/J4eJqPCxpaFYu545KCJkKstD0Z
 JhWUPEKpHjm3iw1Wt3R8QQf4qxvUcUk7zNvJ8bfbIy6If+5CZoI1PdxAcJkj3Z5XGJ0NQaDCG
 FXTljmt2+2CAJae5G+bhGuoRU6hlaHKJbyCr9bOMbKBy6ahnkg0Q2mmXC4+wq/m14R73rJryJ
 PvOy6teHh8+XUs/DwXQvUHLJ3sGNntMVnP+aku6uTmZ1gfSI4xEmUEzf8nxY48BJj6r3plh+D
 281jNNnrKQ+V8ejcMx3031dtwLn9m5dF7/Pf6iYVuoKyrmjQ+EqCd9Wl6r0e5hBYgm5UJwzRy
 my1TSoaK3Nk79TL8Q68WPo63OCI0/Xc4WZZ98a+y9z9VaErcyZPGXxspIlBOI2ahV9wOocr6o
 nvz4L37o1NwMDQCqqyp/WfeuTZa01sNJB6Wgi7xOVVcc3M69LBaa3cKRcgrlv1hgzoq/YVaXr
 BC06tdieVO089ft01JVd+mqnbIsbNSETjGTK8mVFZITWAo+IGCSDUpWmDQ0rh+Gfm3dp+/3t3
 OUFS3cNXC2wiwGBATcblCx9lMXcvUW8nmWh+gkCQV+diRdh3SsE3D6by5YhReUIe4opMxsk0+
 hV4Yx7ItTRsbqZhKvvnFrhMoHmjA+v/oqSaxNLK3J5SUfEgHPnGk6n5PcPxGUuBmGLTfdo993
 Y6AcszhvQL+f7tVEgihQg9L55R8V9vNybBkr1qpwvtJPtOtRJIdV3grDpTwpJF7jfQ9oD238b
 DyZIxlYwo/hSRle3/AIbNWsK9p+Goc0X0NDdDXBXLHOLzgsqsOOH+SiEeiC2/wwj+XOvqYF+O
 29RSD11ojaHte6kbRHzFrHcyI86oFSkonLu2F08vrs4yx2NAWaTBkm4IaI+45Thgtmi11sd6I
 ZGSJ/7sNc2tWztybLtJ75GarSsn1mMMGosalKV4bRJxgY3aI3uUUl0Werhz3jPFAInGmwRf4p
 9VboAcC8P9GIpELd8Q7UEzbFISKlIosau7Bri1/+Bu4OySEpRK81lK452eSde/SBH8AoDmfrJ
 54IubLuKZLUjg1xIrd1v/z2VTeunBn2I2UT4VLobkeomRjvdisWNjnxJsiSgl308ISQk+V6O/
 iUI90nGq6TV7qmtBC/a+8bPQ0a5NOCoDtjxlCDKVRJ4K5SS6JfJMOFUImejXUuXW+bd6v0I8A
 WSRjrST5Seq0+Fu0ILJ8cFtRQZYVpkZ3I29GyIcqfevh2a1tXBxjLlPAQVfzeZubBKWcbUu3y
 K6NW3sTJ9CFVRmzzZstWU5BaRpXwQ7QWlCWudrIJVTsTSFjDQCc0+iYVK1LtBzHEp/AkyrXaq
 MH932UHOuLpf+6Fm8dGDZ/obhr4jZHxamk2PhbTbzzl5uqB57x/eWB1SMYezvPpIWeWJtvDB2
 o39XGTfngmXlBXWx0ERZ80netWQEKUoL4z2vedP0JGoJxwS/ELJk4x4B4IyJOcyXB7HZH2ijh
 vFr1dQTV58h4cKaxSNPT6Vr+jmm77RJSeNCJVO+HVXVyNCl6m9JUDCPwQE1IHzjYgMLtoM30x
 4vCDB9oNpHGT6byBdRpOR5EQ1NsU1xxP87NXie4zstcGs1YLb56pYzpQy7+MHJt8DRGbscuki
 J6Y7Qy2660FusAjcQIBAJcXT2obDa9mQrd93zHnTK1qOUqnXaFf09cS0R1PdwrgYV1rFgMtIC
 lZMMFACCpxhK8Wpk20uUkBX0ftmrqR3/pz86p1KkIVX5FBluY3Fp0hZHsq9xyTtsRvKa37iYM
 FFiDR3z4LfDz/gq9esXqh/dnQMeH8ZdOmXiku2R9o66U7PsIeR4/c1BN94DpDxYVbCtt/R0Ep
 I0L4/rff9y2A+ECO2E6szRkAdiqc4WF6i+v5W7rKckdlIytMbZ3DevkSSCeKKhW+yP1wD7+9I
 Ui/M39qyEwtTeKZjDk/BPNOu9wudjVjYhhDFUb3Vd0Bf/ERIZsrLo5DDF8zmv53QUDHsP5M7T
 ag8LdsjlWy5YxbTCCC/V5pZq2dn8b81cB2HbQTterD1sDwTvB7v1GXKVVaf47i+h9aotpCrtL
 iDd6l3MNLefSvipKZl1Hc4kH6pUPKrAHCYtHUHk6hfqoKuxHHiewXoKHEGnRjgwqLTcjhhOXF
 4M0yCBQR6atfPBfGsTgkVysW3PTPszXrfm1nJQxocfwE15OCOkrsuEkaVQAANKtn09FZ3tEQB
 SiehwTj7bWOg+WRjMRMAX5tnZPYUxD3cxFlvP9VnfkB7ipZiAzfO7+NRbI5CmCNdD0WmTL0ZL
 chaFS1jx6f5m1+OfFg3LayLJ6klS7vFZf/fbAKuTH+aBOlEnYQKhxIqpFibP2UXtvuAZuSEhv
 sR2SNlpn9vLh33LzZ4ULsP2DbTXgOwBlFSZCckbpe5JGonB5siSfNp9QqwLZ1UV36Hz7PA9Cj
 p7WGJo9sjIVhjDov+2Gq/Pmirb1HiPVDawb7nmip2rHxso9yvUxX7pJ4JrZQJYoUaXEqLr2co
 o++RIj933QgieSdvpFLzMfgyoFPa7hhPJZ60C8Xpaq/wCd4xDf5Fvl5dj1rX0+PRsjN95cco/
 p/FRC7N/ujJxNqfpUpbhMyJuWC6GkM6lCnWXHU3xZpZtc47CGxUWSxapH0+RkQrVbazfHHwxc
 1LNCPZ9FZXB9/nWwDR4Im52/+awLCvXVF1FOzWVEdLusd/6RnqPOQl/rCJURYmqiFFFyfjaMx
 cpH/uBI8LXm2fkW/wW/7qI9iy1+yjwVVKkmsgKxVM5a2cknkH7dp+dhNldIcHFKMTsnkwLmEm
 JzjYJJJTLzSxd4a2BJC+MDfaxdgtlpABFFj7ugK0RLibk1QxKa5FBfs+m7kFbxrKX3l/AydFs
 5cS9qlVAMUiQIS0qgHVoFEwiyHzrGnv1Shhvlz2kSua3q7exr6mOb9NvoQ5y7wmbP4I01zUjD
 CMRiX+bIwII5+7uZE/MvdRtLhWbVVwdAyIf4DlUaMs9NRnNnbBYhALpRTHDP/jenb/YVgGamg
 VkOLTwTNBU1jUe+S6Bqx8ybP39cp0qDTmiLkrKMcqAco8SoOgzzBQFk0jnxv29Hl23E6h9N5k
 3a/k/0EkvqDRBozO2BRA1tCWQ+LNg4UM2mCT1yYXfEPulzL3RJ11mpEoH1fxBFQwQJy4u2tJb
 mhV/TLrRwTylqDFEVG+Vg+vReJQE6QEwC6n4mxDbEkDht6BuZsmM8JgfiwXHGaRVvJzv1oaID
 u4fAtaod1URagrI+967CKiyTBmGRTS9c/h7ydlZPMQ9InuZbGGla+aZHvGrtMUPLWa8yCn/bb
 8WnvZ4rFt9vmDLjA9j+lYlOAEjg4O+6SKaFv5R0DqFbmQCI2ck+w5ZT/A/JNa1msPThgeO4MC
 ZTUhR0zTuXNbXI0go9fnqGchrOrY4tO5ZDh8zShHyZsScvgHN6GjN4nltsMeL3+Jpkc3FH3D7
 WB6vWJAWmDjHApZaNxPqPLGiMFg838a49ff6ABPEGMW5KeGhK3yx9fvQS3jMWAPPmskAREBft
 8Ce4PsEEjvdcvp+SGO0A+rHqEcnIs7biGSeowqu4NSfeGT6ZXQKuJ+JVfwiFcR3mmgmgFop71
 ZSkox2kAO2NCJFl1IIcmFUr7T21PawU9hPyj6pWKN4ESatomPnBBSIDPoL6uPFDXE97Qb0kPM
 xBWizt+HQv3EusVXYrAVBY08b1BET2UP9hjmEQGor9/wE5ICfiTVikjQnsTEMasB7CcseS+xh
 kWxOMt565MMI1GA6qZowj4s/1820V6v1OT1Kqz6oBEDpF/iFgeLIXYq7c3t9Bw7KtL/TBtSWq
 5H/8Rxc29Sv3xjr/m45YinwbEji/+q6TRRRXIK3IFHqPgm8Yytxr9+NZxvHwvUVtm0aDKMTQp
 B7OWPt+26c0iXSaDr/wwfNTIV+oyvEKUnfjkAB1k5BeAPBB4/0YhM9r9YekJS/gUSvSJ3+xVi
 7JQlruVfmFIchYJmbemb1a+NKJ+d7w7Ou0IkMrXeT/oRZJ60j/gdumaXokmWaPFXt4OnkqDNw
 xzFizDL+ZHtnU4OEYO9tUqdYfLF2q6dQcALa2z0YIya4mOMG5DLC0ASuPa6SDKoJ9W+wuhswB
 Do1tVR8VCNeP2+575JDu+0HTVzo9GNoAR9q1tIgYtAjxyKeKEnsPGXxpQI1vF587acZdK3aYi
 ldkFZjNjAmbsfRzAcOsMhFFGyVyzsDz+3v/OOVv8ytXgKTv5SDFaWj4/Gg4LGDGB+fPeRlPaY
 dFEUnM65klJTOfriMX+jnCMLZENtX3eAK61TR4MRWnm/7nGVgtdWwYVqR6tM45w5UVA570ZA/
 HooFopOKiCUH1ONOGVDshejISeY8RWIMLyLLZoOoOaTr5WMD1eGhk+fnLWogu4IxCUa4hmy/s
 atLKlQNMQ7zwP+npK4lCbpjBH2z1dGPIWq3vVpTTdk1ONRnhqBbaRaC7yPM3vO2FJJ4/KKeXO
 vwuhJMBAY62r4bn8dt7eKmxSYNk6DlrWk3U+VQC4RfgCljQ0/Mwm8PgAzm++j1BDBQp/NYJ1r
 28CkKG/BeuwkqhhFeXxiF2RdGzjDUSV/9TQE2MQoBfDal/nS1KoGDcwW4GDY39lcNyDfI97O2
 SCWL5A7L7DYdxqEWJdigzf1JS9gHc9ah0rmB7P0Gzz7BVYOhovDbW4ndOgarpfzzn+fsBXdms
 u4kRql3kC6ZWdJF2QDMpHpOeghcUB9uwHbfSPs2wRB5T3cIhyimmp3igXA58XTYjECRbJgSv3
 fQR/IbYvMhF1mJ7d46ZIqbqoaX3V+K8Exfk9M88WLKDm/X1DSAoHwYV+07uAvErMLeary3/7l
 9/4m2sL9KPOTJysp8MWLRNkqrCwgDnJ6lF88MKYGeDhrHlPY1s8bLg8xGoLKAIs5q5URQjztP
 SpJS+z0i3c7fdEsk2tyGYXT/FyZ421lRxH1nBCzXoadJQbKppG+gg6vRn+1OH1gOZSkgu2e7t
 NqRpApHUHK+HNy/7Xpll37we76ProrudIbC/40cW3bCScZqc79amncrtIebbecLvBGgBO84S5
 1vUcbQDj/lldcqOZoxCZRlV0jfqDpn+aZ3hndax25UjJ+d55YDQ==

> Add check for the return value of device_property_read_u32_array() and
> return the error if it fails in order to catch the error.

* Were any source code analysis tools involved here?

* Did anything hinder to add any tags (like =E2=80=9CFixes=E2=80=9D and =
=E2=80=9CCc=E2=80=9D) accordingly?


Regards,
Markus
