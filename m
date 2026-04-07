Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741E43B8BD9
	for <linux-hwmon@vger.kernel.org>; Tue,  7 Apr 2026 16:12:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775578374; cv=pass; b=U22MxUhkV0fTsKfl0hMZkhLbBl+DCIzID1dp5b0SSX9owVxkiwEAUuLJmeItjwGZaZnoLeoO9JEjoG3h+SppsLLnuC8nkCm8JmWOh2qUHpPKDDLt4VTXxxpL/71tDeudey5Qz8FkydycaHqibl/niI3xXftA9EfV5gp8X7wVbIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775578374; c=relaxed/simple;
	bh=PZJu0y1LA7i7A8uF9DKAUABTFfWflVp8QXqMbo19uEE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZHR6eQyGcHuUYQBE3Tx8I1frD+HNtijGmypUiyesOcktluKdjpl/r/tY3mztVRYvI0RVk29k1c0jRDW2BZhdD2Rxnke/UooKkTXEKPU0GA0Ap7byAK/HeWOjidahYTU6q+pXjd19kajhNatZldQatKYFSKTCiSsSRe2fIQqKvE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mywObNxB; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mywObNxB"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a2c981e5dcso5442600e87.3
        for <linux-hwmon@vger.kernel.org>; Tue, 07 Apr 2026 09:12:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775578369; cv=none;
        d=google.com; s=arc-20240605;
        b=Fin0hLwzg9R2n0bCabiPYKjHGw1Qxt/Ghci2y6/4Qv27OqQtQG8OPvh0Tezyim3xrE
         vRfXSYjAC6B/WgYXvbmbtT5Q8pVzEJoy5XYyKmvC6vkKzGgePLq09Sf+KVeFNyR1H0Sn
         0dFwwdk/A5cnTTlL3SPKsNjqoJRl4W4U2EJYfvVy4ULXJpba6e0C63aS5FkLlghK7Byr
         OQ0IQ8gVQcaEyD8Co5Y/evmoGqXIYUISscE/31IW4Hu1RIdxbSfu8IfhwZyFJZ6AS77a
         x0jCK9xnEB1Qco02NB5fRSKpiC0afGCl3kn6/9YKxhmT3L+yX5f+JAXbNGoBH1w1KCBS
         nN/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jMZwwAVd8FNgUdw3QLf8glhDyeO5NVC8Pxe8yFPrLq4=;
        fh=tf+pRiZzZBXcZeEBcRXmXrDt8Ti9PrrhWx6ZOso3bbA=;
        b=bL7wQsojPLXno2JWu7jYK26hPjZb3t2W+wNxrqx1My+4upb8Fn7P6R/5/q/XS2fTkW
         pAWtl4nsiA+XIMV7rFqPPWoxNiHZS7kP2CjmahmSEH8vMxnVqJ4nvyBdMScmZ2dj/n4N
         fE/xV262lVKyhtZLYOVrv5TDEAklLG3VS3+mL3f/TISUwN6DLtfFaw/fyCnpFhOb3IVq
         YXj9xLYPT1WyB0HL2+wVCkGRYV4FPNOTy1sB9owPT8YQofNdbYh3viJ7jEbrjuBX7owc
         irVTjtYNOCyntuRytHF5PTaKZ1UlBkt7JT7WX1mxaCzW8eBpMdRkxmOgXECh2x8IuYyi
         stBg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775578369; x=1776183169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jMZwwAVd8FNgUdw3QLf8glhDyeO5NVC8Pxe8yFPrLq4=;
        b=mywObNxBnkM/NFnLsxzQpR9ISgRP9BYRiZpqaW0uNhhhaLWl1dFImWGk/7vpzNP40S
         SY/1+Mh1ZB0lV1y9XJWfZj8Jutf1FaihEBQAW/eqBLOSH6pVth5MlTWK8zw5k3w2uWet
         EkQquc1cmh1zS48vpN42b/+IT5x9VitH8ZDKiol6etMN6qONUqM35X4gnIVrkbYHZOt4
         sgF/WNmfHOukORSILexSQGqMVUyp2DIfsPgYgwy75wylBE1reZS+//hqA3AJau9EE3/b
         BKsAW5megXWxB0RjHx86oiAJJSPBzv+o4UPtjQMLqRXm5hw130kSRPilvUSNxFeSvgMr
         WR4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775578369; x=1776183169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jMZwwAVd8FNgUdw3QLf8glhDyeO5NVC8Pxe8yFPrLq4=;
        b=AKQpN+ShMKrsTBtTjbIwIjZI8i0KK3fR9NRPymfyRwViWKEshlHr9PR4ZORKNxZZC3
         e9LnZtXObpE4759ZnM+yU96hjl/rFBUSkgWcTlcAwWdGTr9dzE9IQpjkutBFYt9XZO+h
         p8ci3+zdFPatVDCTnDdxwdaMW29xv3yhjKlj2VaoeU1HCbUz2L9kxNuBmEQJlJeEHjLD
         vaC+FtRGquaZ5fJtgXDEQbrYmNQ/j/ftCNcHq4pil+1DiLAvC3iizrAxIxUAq2ODviZE
         Cd2iDYwA8dEc9iSJ5TBqNliNxlGhh040yJR2kUyV8DmllCn4erTejC+AWZnC7fdvIwmx
         6SDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnHcZYMcjaaqJPV3vDq+cGr2o4rIVu7D9NGZQV1LoX0eHXFVOJa3eFhWSZ5TDgMBuYv4TTBLVtLoVwkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxPk9HpTcOeIhUoGrVhugyuN5aZbgpFNvX/EVJp248btE9PG/z
	2thJ/sCNkr0VSJDQUk8LLSKS2NUdGsrmSqGawUv06UZbrhqn3BIyXIytU1VNHyOmzOOIxEXYJv4
	lXGLNdNYgFEHU80utMwZCNp2b4gSSC6s=
X-Gm-Gg: AeBDievfp4cMe6FPzxy9AARyOycagomJ8d7Qv2FyiCNhD1/ZC5797VclgSHS00s5ok5
	LV4xkAYvTFFaXm235DCNlkQVTHHzAhNR8SDU4hh0o+NtDjeGkEnLDv/DTb0tfOJZHb1BG1rcy51
	hYvtO7+tsvr5wn8Kjw1e9anuqGtb/GCTYCjBF3iYd4+v4pGgG+lpGuWL39ERO8nUu5Q0utKg4o5
	Dx7JpAxyLpqlt5LyxOegNzh0Zaodvce3hw4jEqbKk4p1+dIeJQZR/TITG7+CfhpqbSbxf+qgN95
	KgJSkWqOOYqyCJN3v1On
X-Received: by 2002:a05:6512:3e28:b0:5a3:d10a:8360 with SMTP id
 2adb3069b0e04-5a3d10a856emr4276810e87.31.1775578369090; Tue, 07 Apr 2026
 09:12:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260407052317.2097791-1-rdunlap@infradead.org> <7752cce3-3362-42c0-becd-96dbc7b17cab@roeck-us.net>
In-Reply-To: <7752cce3-3362-42c0-becd-96dbc7b17cab@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Tue, 7 Apr 2026 18:12:36 +0200
X-Gm-Features: AQROBzDez180iEcJ1lpdn0o4JkAuqAZ5B9rcT4jvOfo4mAHFzjqbomvGD8x0MHk
Message-ID: <CAP8e=sLmwXWT+O-z4NfLQ_EELsiYQUgzOg1NFf9XDPQo-2mozA@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) various markup improvements
To: Guenter Roeck <linux@roeck-us.net>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

My apologies for the confusion=E2=80=94I am still learning the standard
workflow. I understand now why applying Randy=E2=80=99s patch immediately i=
s
the correct move.

When I mentioned the "next version," I was thinking about a major
expansion I am currently preparing (v1, second round). It expands
support to nearly all Lenovo and Xiaoxin models. Because the database
has grown so much, I=E2=80=99ve had to significantly change the table forma=
t
in the .rst file to keep it readable. So i was referring to this new
table (see below). Fully open to modify the format if you thin is not
ok.

As an automation engineer , this process is quite new to me, so I
appreciate your patience as I learn the proper terms and procedures. I
will ensure my next submission is rebased on your current tree with
Randy's improvements.

Best regards, Sergio

::
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
LENOVO FAN CONTROLLER Hardware Abstraction Layer
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| MODEL       | FAMILY / SERIES   | OFFSET  | FULL ACPI OBJECT PATH
      | WIDTH  | NMAX  | RMAX  | MULT |
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
+=3D=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+=3D=3D=3D=3D=3D=3D=3D+=3D=
=3D=3D=3D=3D=3D+
| 82N7        | Yoga 14cACN       | 0x06    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 0     | 5500  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83E2        | Yoga Pro 9i       | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83E2        | Yoga Pro 9i       | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA2S
(Fan2)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83CV        | Yoga Pro 9 (Aura) | 0xFE    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 0     | 6000  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83DN        | Yoga Pro 7        | 0xFE    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 0     | 6000  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82A2 / 82A3 | Yoga Slim 7       | 0x06    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 0     | 5500  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83JC / 83DX | Xiaoxin Pro 14/16 | 0xFE    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 80    | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83FD / 83DE | Xiaoxin Pro       | 0xFE/FF |
_SB.PCI0.LPC0.EC0.FAN0/.FANS   | 8-bit  | 0     | 5000  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 81YM / 82FG | IdeaPad 5         | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 4500  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 83AK        | ThinkBook G7      | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 5400  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 81X1        | Flex 5            | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 4500  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legion 9    | Legion 9i / Extr  | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legion 9    | Legion 9i / Extr  | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA2S
(Fan2)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legion 9    | Legion 9i / Extr  | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA3S
(Fan3)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82WQ        | Legion 7i (Int)   | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82WQ        | Legion 7i (Int)   | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA2S
(Fan2)  | 16-bit | 0     | 8000  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 6500  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82JW / 82JU | Legion 5 (AMD)    | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA2S
(Fan2)  | 16-bit | 0     | 6500  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| GeekPro     | GeekPro G5000/6k  | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 6500  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | _SB.PCI0.LPC0.EC0.FANS
(Fan1)  | 16-bit | 0     | 6500  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 82XV / 83DV | LOQ 15/16         | 0xFE/FF | _SB.PCI0.LPC0.EC0.FA2S
(Fan2)  | 16-bit | 0     | 6500  | 1    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80V2 / 81C3 | Yoga 710/720      | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 59    | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80S7        | Yoga 510          | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 41    | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80JH        | Yoga 3 14         | 0x06    |
_SB.PCI0.LPC0.EC0.FAN0/.FANS   | 8-bit  | 80    | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20344       | Yoga 2 13         | 0xAB    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 8     | 4200  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 2191 / 20191| Yoga 13           | 0xF2/F3 | _SB.PCI0.LPC0.EC0.FAN1/2
      | 8-bit  | 0     | 5000  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legacy      | Yoga 11s          | 0x56    |
_SB.PCI0.LPC0.EC0.FAN0/.FANS   | 8-bit  | 80    | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20GJ / 20GK | ThinkPad 13       | 0x85    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 7     | 5500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 1143        | ThinkPad E520     | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 4200  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 3698        | ThinkPad Helix    | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20M7 / 20M8 | ThinkPad L380     | 0x95    | _SB.PCI0.LPC0.EC0.FAN1
      | 8-bit  | 0     | 4600  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20NR / 20NS | ThinkPad L390     | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 5500  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 2464 / 2468 | ThinkPad L530     | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 4400  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 2356        | ThinkPad T430s    | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20AQ / 20AR | ThinkPad T440s    | 0x4E    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 5200  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 20BE / 20BF | ThinkPad T540p    | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 5500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 3051        | ThinkPad x121e    | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 4290        | ThinkPad x220i    | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 2324 / 2325 | ThinkPad x230     | 0x2F    | _SB.PCI0.LPC0.EC0.FANS
      | 8-bit  | 7     | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 81AX        | V330-15IKB        | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 5100  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legacy      | IdeaPad Y580      | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 35    | 4800  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legacy      | IdeaPad V580      | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 0     | 5000  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80SR / 80SX | IdeaPad 500S-13   | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 44    | 5500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80S1        | IdeaPad 500S-14   | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 116   | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80TK        | IdeaPad 510S      | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 41    | 5100  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80S9        | IdeaPad 710S      | 0x95/98 | _SB.PCI0.LPC0.EC0.FAN1/2
      | 8-bit  | 0     | 5200  | 100  |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80KU        | U31-70            | 0x06    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 44    | 5500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| 80S1        | U41-70            | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 116   | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legacy      | U160              | 0x95    | _SB.PCI0.LPC0.EC0.FAN0
      | 8-bit  | 64    | 4500  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+
| Legacy      | U330p/U430p       | 0x92    | _SB.PCI0.LPC0.EC0.FAN0
      | 16-bit | 768   | 5000  | 0    |
+-------------+-------------------+---------+------------------------------=
--+--------+-------+-------+------+

Note for the  raw_RPM we have 2 cases:

* Discrete Level Estimation
    **Nmax > 0 then raw_RPM =3D (Rmax * IN) / Nmax**

* Continuous Unit Mapping
    **Nmax =3D 0 then raw_RPM =3D IN * Multiplier**
