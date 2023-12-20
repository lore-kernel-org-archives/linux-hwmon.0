Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3F020300;
	Wed, 20 Dec 2023 08:45:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jv8bL2s4"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-50e51a7545dso487804e87.2;
        Wed, 20 Dec 2023 00:45:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703061936; x=1703666736; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=9vGIFGdre+gJrQD1+rcG4tn5l3gvv21wwwnNDTST4qo=;
        b=Jv8bL2s43Qt202UEp0xCUbkD8pTvkYSkUyMIjG8CM6S9zdRw7RhQWuYSvqU1fkHyk7
         NfHdVQA5Bx1dC8chgLPSQQE5wdqDZ7/9vLw0uV1pZfBQzuDAi7WaHjfggoBCkscPYggh
         bQZME9cItUTlg+M3c3OSIJvGcnxpnVZhKmkhZdMdVYv+XrMXu/dtmsqNwSxKvQ4IIgcf
         AsytjLgSX0iArASFSwUgEp6IJQU3+RBrpySz6cZowzVTFbhvaJT+FqIoDVJoiIgkh7OZ
         wYHLSNXD9tRTRFCTAKoYEU1XnRhnq2G6ze1X48skN+JGioeqmxr4ySyWJMDeaOePtKS7
         EJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703061936; x=1703666736;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9vGIFGdre+gJrQD1+rcG4tn5l3gvv21wwwnNDTST4qo=;
        b=ZLAeBasyF62z1nnBCb1Gcb4q1UAdQr57H1biltQJLJo0yo+Jm8kV3yY22Q8cvHFGsp
         xgYFVTQafl9HjkZVn1WeLdJYXUVbLWlDH9lgh503nv7HEypgKWo1jzKFppyAafuOZVD+
         A9hzsW2WNg2Wk7KBQjSfsrQKMpT+Uz2JXJwsOm4YpkAY/pe0XfjXhzT5Y1A4KomvMUiN
         Je5IDsKSF6rnrvof8bBrtKN/MpYeL70+KdUbvvqzM85Jb9qDiIjacBqTFA1Xpplh5Oga
         MDkP1qs/FHLynJBaGkPu03e0LjJmSQ5O5lZOX7ZVPPMQoFV4MOxWYWrxsunbJoXj4zaK
         f9sg==
X-Gm-Message-State: AOJu0YyquzeuMEZVvvKCxIhvW/1cBZkuqkE5cjHbycMt1mkGFP6u2Y0C
	/r9tMI+W/6wmrt/NJeRzqbs=
X-Google-Smtp-Source: AGHT+IGy5V7f2uqdaOZ0No2+Cfabn1E3aHJBVKW8+1hsSBNAX9Bk73s/GT9Pf+gvCLYGQgq2mCft/Q==
X-Received: by 2002:a05:6512:238f:b0:50e:3d93:2210 with SMTP id c15-20020a056512238f00b0050e3d932210mr2711087lfv.9.1703061936037;
        Wed, 20 Dec 2023 00:45:36 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:15d4:fc17:481e:8afe? (p200300f6ef1b200015d4fc17481e8afe.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:15d4:fc17:481e:8afe])
        by smtp.gmail.com with ESMTPSA id cx7-20020a170907168700b009fc576e26e6sm16275668ejd.80.2023.12.20.00.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Dec 2023 00:45:35 -0800 (PST)
Message-ID: <32be5cae6429076d07bc944f4e1db379ba490361.camel@gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: Add LTC4282 bindings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 20 Dec 2023 09:48:40 +0100
In-Reply-To: <20231219-cusp-bottom-f96757a74ad4@spud>
References: <20231218-b4-ltc4282-support-v4-0-4fc51f7d04f0@analog.com>
	 <20231218-b4-ltc4282-support-v4-1-4fc51f7d04f0@analog.com>
	 <20231219-cusp-bottom-f96757a74ad4@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-12-19 at 16:39 +0000, Conor Dooley wrote:
> On Mon, Dec 18, 2023 at 05:29:42PM +0100, Nuno Sa wrote:
> > Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> > Compatible Monitoring.
>=20
> I'm not sure what to look for to confirm that the gpio2/gpio3 muxing was
> fixed in this version, but the default stuff was fixed, so on that basis
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20

Thanks for the ack...=C2=A0

The muxing is fixed by adding the new 'adi,gpio3-monitor-enable' property.
That's how we mux gpio3 into the ADC (so that pin is monitored as part of
hwmon). Note that if that property is given, I'm restricting the gpio2 allo=
wed
values to 'stress_fet' because we can't mux both pins.

- Nuno S=C3=A1

