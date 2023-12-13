Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hA7q6eHM"
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 34A25D63;
	Wed, 13 Dec 2023 06:44:26 -0800 (PST)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-50bf3efe2cbso8066337e87.2;
        Wed, 13 Dec 2023 06:44:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702478664; x=1703083464; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=247l+rcM14kykhxTNl3mbLVe+ul76O9sNfKGqS/c1U4=;
        b=hA7q6eHM+YEYyHrsLY9iQ7vUrlgfD46JTV/RldRSWU4+blQ+1MlqN9FuRd9ozmbVr5
         bYynNRPUP2dJNSTb4jB2zv2GWl1EWFspVZN2KJ1Fk74ZK3o9XQiTR/BJmcrdpxF/cp0w
         v4HJsMJ3LSHIkurWP39RA8mN5ttiaeDFbLkN6RVOfCiX8+hVoPhQAYLpveqTeokd4PWF
         4FDXDa2u9woTFc59w5r9EjsAjQPmArFlAcTGNLgwUuxpD2XVx+hmaXSa4DW5hbjtCkNA
         AFE7EmC3sY1jqkRR6oHXjoIUwP3ShgRpDBjIjwZrzfb2RZmthCZjqOt0GSRYcELizDV6
         e8LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702478664; x=1703083464;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=247l+rcM14kykhxTNl3mbLVe+ul76O9sNfKGqS/c1U4=;
        b=hcsh3Tdil/xpwjhufSGWP+e7/s4bm+mq28gRd01vJ444DszBXhOnUHoTjCKmQFUjwq
         ShkYSKBI2OkPAA+s0E1mzs5HAElBNaa8uQ+5uLMd063PiyCqkniqz1ZGPt3r36fK1kwf
         PTNIO/mL+D1LfkR4n/b0JAKnB4wM2cowZX0+pfge32gqX9rS5EqzU5KRffOOECQNnF9M
         ZEipiUzt7SwzmhClzZMBPGvz8nsLRX7GFKNvdLrJg3rVjn8t02vG/Map3XtWhAvgL5Ty
         U3hTPys4tEysj9aqhQvA72HnNFjco1SFcUjOqQYF+XBwtsBDrfA4zfqIeDXDa/9AxbUO
         Ojvg==
X-Gm-Message-State: AOJu0YyL6eQryWOGrRKWLP6b8koFH3arHdX3+mlIxihIC59vvoa0MGUD
	JjnkcIovyBdVcC/BCXay+cM=
X-Google-Smtp-Source: AGHT+IE9xDobGtuFHBEZX870IVSbo0wphjnaFT+8js0/53mzF81jZlJANosifpCc9Ik3NvXQbCPyow==
X-Received: by 2002:a05:6512:3d1f:b0:50d:fb24:a032 with SMTP id d31-20020a0565123d1f00b0050dfb24a032mr1951533lfv.74.1702478663924;
        Wed, 13 Dec 2023 06:44:23 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id hu18-20020a170907a09200b00a1e081369a9sm7822548ejc.23.2023.12.13.06.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:44:23 -0800 (PST)
Message-ID: <114c8347063d196b58f48bb5ce9914144e215c4b.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 13 Dec 2023 15:44:23 +0100
In-Reply-To: <505ac1bf-616a-443d-b2bc-a54b3c193757@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
	 <a0eb6cb4-b8af-4a6f-8888-fa18f8f1d188@roeck-us.net>
	 <d190620900ceda6c2846f3828ee389da917a66e0.camel@gmail.com>
	 <436257a1-628e-4a45-884d-348e73d4c5e9@roeck-us.net>
	 <38e41d0b92c0cb1f61e7a1d92137cc94a57a7f85.camel@gmail.com>
	 <92699a3e-1198-4bf9-b5c0-ea8c5c189336@roeck-us.net>
	 <cdf4876c8e5f70d70ac362f79f295cae5e39b1ef.camel@gmail.com>
	 <505ac1bf-616a-443d-b2bc-a54b3c193757@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-12-13 at 06:35 -0800, Guenter Roeck wrote:
> On 12/13/23 02:06, Nuno S=C3=A1 wrote:
> [ ... ]
> > >=20
> > > We could also use in[01]_reset_history. While that is originally inte=
nded to
> > > reset
> > > min/max voltage history, I think it makes sense to extend the meaning=
 to
> > > include
> > > fault history (even more so if that history includes over/undervoltag=
e events).
> > > Plus, there are other _reset_history attributes which could be used t=
o reset
> > > power/current/temperature history separately if that is supported by =
the chip.
> > >=20
> >=20
> > Well, I'm already supporting _reset_history in the voltage/power/curren=
t channels
> > so
> > I can easily extend that for clearing fault history if that is fine wit=
h you. I
> > just
> > need to document it because it's a bit of an "hidden" thing. The questi=
on would
> > also
> > be, should I just document this for this chip docs or in the general hw=
mon docs?
> >=20
>=20
> I'd say chip specific for now. We can document it in the general document=
ation
> if/when we get more chips with the same characteristics.
>=20

Agreed... Alright, I think I have now all I need to work on v4.

Thanks!
- Nuno S=C3=A1
