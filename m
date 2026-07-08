Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84444430CC3
	for <linux-hwmon@vger.kernel.org>; Wed,  8 Jul 2026 11:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783510264; cv=none; b=qCAezWOkZiCFtI/6Xbiyzc18G5dpVg291WoPAe5l+ZZV9PtAGU8pEh4ptwT+vpvEcAECCTYKJZ0M/BCMexEWrVDH2PxSBYxuEQoy9nSLIHXv8rIccgbKvNO5TqRUqMSd9fSGkaekbTd5XinELJwZmPq6I52zUhgsVmI92SfKbvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783510264; c=relaxed/simple;
	bh=UqVYtH1FlnS/aiysBtJjKkotNDawE18yaWKbuoyRfnk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LibGzFsN3w9WMUjGFbh9jVaHl33Embrl/uATKS2/KBfDeYwkmUjfJqFa8rs9PN0HVK3FASHSlR9Y9g3+5nx1P5IYWy+mxb70b9x91NQrMobvYr05XH80AMvSWit2w10rj4c7EztBXsWc+DPrR0mQWjxgY3W76k3kPrSGe0MbSjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sTW5MjST; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sTW5MjST"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5aeb11c7347so416016e87.0
        for <linux-hwmon@vger.kernel.org>; Wed, 08 Jul 2026 04:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783510260; x=1784115060; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=39lBDIePAL1NkZjwy0kg0GS1VSHJ5/FOzCIFnS8mpzM=;
        b=sTW5MjSTnFr6r/JlPxnI3BE7aoTJeXE8JYAW37w3nGv6YRpTG+WJuytWtQ8RCEYO0z
         pzlxY+S7YzztULVvPDwJQPuDNWAQrpO02nvcnZAYta5y6QvNdGdQqMInEV+vc7y1vsLH
         aTIaKz6V03aszfCW+JjnwgOdo/iV3GE13GN/XXtNdJaUKc9Wf4+dw8NS5SZeuloJSi3+
         pCJ9RgFdzQHLp8OMNX6zEZpR3Ec+SC+coiBStKA6/YDUIjx/xsSaScEQGC1i8ElkDuav
         9ygcKPoZwJrymEaQoRf+G5nxVE3MdCEldttrNUHKiYS+oD0Xf8quxe2H5uRPMTRSQwHT
         Qu+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783510260; x=1784115060;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=39lBDIePAL1NkZjwy0kg0GS1VSHJ5/FOzCIFnS8mpzM=;
        b=IWWhYglBEV+L++e3IQoozeUXKtaY0EJyfUgxIxf6yPY/E1DC6bJ+5ocmKHfxUlJ/NU
         ayaLnXuE2RefPvgl3GzVtoF9etbxR0FlckVaP8yfpIGrthA3oCglKK9uwbMz3LS2mMSg
         rCsTm07PmWYFcI+GGk+zO+Tk25KG+hGEfsqHQjpdtXEZYu+DWZfCqptfGKqZ+AkTuR8w
         NAhfN/gyGD6UhNaG+fgtkxizDFNNe0zmxEPdQXSm2RbzpouqyLIjfWslD9lokjLquDBt
         b8blLQyBbab0CaT2UAWikD6m2IxJvyO0WY4QslkkTxmXKFMHXxqf/FxdMsvZXKww3Ndm
         gkQA==
X-Forwarded-Encrypted: i=1; AHgh+RqtYF0nOnoF9N68xOJNm26+ROiu75IG3eOIuwSN6iIM341hupxqiYYdPcjIQN/FWweRyvUciwmofWLWrw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yymzn+yfo5FOt3dRKCFkxRdMbE76VLeZbO1rhJrWtEDgPXCVPgo
	UNkt92kgzW1/7FO9Ap0o1cGC4jz8B7JWquWfLnchcHzBLAJySp2PSS4z
X-Gm-Gg: AfdE7clfzqH+6XwBFtsJ/bPmWn3Q1Y1fZYj1hM0KsiCaK69QW55DwVIGDEtUY1qO4sV
	bYop3x3QYOsK86fyutmxx+vwG6WffMLxVUzYaCn8hTXRr+/mAoPDIuMsqGlVXGiVBYr6EMeGTk8
	2o95I2mncsZ0gQ+ZkFgjUk4OMLbKFTCThB9p8WTGr1nGOo6UguE8kb2T5cdJmASbLnDUtLP4Ob7
	Jf2oLpiht2hzXAqRBNMBNE7hpqcbJ7QQRnQczw7KArR1Ws3vJwqpsKJHoO3VdM3EubMx1he6HXo
	NQE8PT6jIdrYmP1Cch1hpKeiTo3fiIxxC1paU3E/430GT9cwJNwx29PFnfcpyIGHO2PN7EYgZnK
	QGzJUvs4QcuUFl4JbmQ6pqZrjiXjnb5XSNH/z5am43ZFaqWGsOLJ2/a2BCvE38TDoWP1663Yhxm
	sGUQmFREr6LPZz0yk=
X-Received: by 2002:a05:6512:1417:b0:5ae:c8d9:dcf6 with SMTP id 2adb3069b0e04-5b011463131mr553458e87.37.1783510259389;
        Wed, 08 Jul 2026 04:30:59 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13700fasm4437116e87.5.2026.07.08.04.30.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 04:30:58 -0700 (PDT)
Date: Wed, 8 Jul 2026 12:32:00 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, 
	Fred Chen <fredchen.openbmc@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, Wensheng Wang <wenswang@yeah.net>, Frank Li <Frank.Li@nxp.com>, 
	Brian Chiang <chiang.brian@inventec.com>, Cosmo Chou <chou.cosmo@gmail.com>, 
	Dixit Parmar <dixitparmar19@gmail.com>, Eddie James <eajames@linux.ibm.com>, 
	Antoni Pokusinski <apokusinski01@gmail.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
	Ashish Yadav <ashish.yadav@infineon.com>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>, 
	Syed Arif <arif.syed@hpe.com>, ChiShih Tsai <tomtsai764@gmail.com>, 
	Abdurrahman Hussain <abdurrahman@nexthop.ai>, Kim Seer Paller <kimseer.paller@analog.com>, 
	Colin Huang <u8813345@gmail.com>, Yuxi Wang <Yuxi.Wang@monolithicpower.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-doc@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (pmbus) Add driver for Analog Devices
 MAX20912 and MAX20916
Message-ID: <ak41BRQBNdsQrYww@nsa>
References: <20260707122701.751878-1-fredchen.openbmc@gmail.com>
 <20260707122701.751878-3-fredchen.openbmc@gmail.com>
 <f9e32dd1-7c2c-4055-83fa-94683777e30b@roeck-us.net>
 <ak4QO9uhKOt68dl1@nsa>
 <20260708-true-carp-of-champagne-a0dcca@quoll>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260708-true-carp-of-champagne-a0dcca@quoll>

On Wed, Jul 08, 2026 at 12:50:25PM +0200, Krzysztof Kozlowski wrote:
> On Wed, Jul 08, 2026 at 10:19:56AM +0100, Nuno Sá wrote:
> > On Tue, Jul 07, 2026 at 06:52:48AM -0700, Guenter Roeck wrote:
> > > On 7/7/26 05:26, Fred Chen wrote:
> > > > Add support for the Analog Devices MAX20912 and MAX20916 dual-output
> > > > multiphase voltage regulators with PMBus interfaces.
> > > > 
> > > > Signed-off-by: Fred Chen <fredchen.openbmc@gmail.com>
> > > 
> > > Please provide evidence that those chips actually exist.
> > > Internet search comes up blank. I'll need confirmation
> > > from someone at Analog.
> > 
> > Hi Guenter,
> > 
> > Well, in fact I'm in the middle of preparing a series that adds support
> > for:
> > 
> > "max20826"
> > "max20855b"
> > "max20908"
> > "max20912"
> > "max20916"
> > 
> > All the above parts have the datasheet under NDA. But before we had a
> > one page "datasheet" in analog.com but I guess that is gone! For context
> > I mainly did the base (core) driver for max20826 and then Alexis added
> > the other ones.
> > 
> > Not sure how to proceed... I can wait and then work on top of what Fred
> > has but this patch is very minimal when compared with what we have.
> > Like:
> > 
> > * No regulator support;
> > * No direct mode. The chip has two ways to access registers (paging and
> > * direct mode).
> > * No way to count how many phases we have or if RAIL_B (func[1]) is being used at
> > all.
> > 
> > 
> > Some other things more intriguing is that these chips, as far as I'm
> > aware (at least for max20826), always have bit 2 set in ON_OFF_CONFIG so
> > a gpio vout. Also we needed some special handling to read phase current
> > which I'm not seeing in the driver. So I would like to understand how
> > the chip was tested?
> > 
> > Anyways, if Fred is ok with it I can just finish what I'm doing and send
> > the patches. It would make sense to have something more complete on
> > submission but I don't want to just "steal" the work already done.
> 
> Binding should be in such case posted complete, so probably not a
> trivial device.

Yes, in my series bindings are not in trivial as we support the enable
gpios.

- Nuno Sá
