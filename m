Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D8C2DC78D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 20:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647581; cv=none; b=A/lPdA86weF9P1c0QACtnLAqAlMP901+Etj9rID0pkuMhVSHCrGXHVmDPScmPtsFXUT/uCfkUftBmsfDqlkAzQXb78zLMX3dkBVG/jpDUBx7ANaoHonkPyeRSgniUNmle7h67/6K8h3PZaukhftwTLQAiFwV1Os3TBCYEn0JoN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647581; c=relaxed/simple;
	bh=0IJQhhsY21kSiG4vUShPsisj42ZivnjaHKFuaETuTtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVE3bx9ehCtq5zRAimHkXCPX+tHX2sS+RtDjiTa0OmfADe20AM5+tsEG29FLBgUDdbfk7IHneupAxG0O927xBrrHDnZC66GbglZqso19LNdDqlzonY+ucWRY2PtuMogz4oMwik4KR6RgjbE0HhAKqoc6GklHHLRObqe3Tq+RVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iVtyg6Qf; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iVtyg6Qf"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-7835321bc98so1186052b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 13:46:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647579; x=1761252379; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ai9+Zzzmk4YgwBbS11BlzZbpFH5SUN3q8VaF2OQnw=;
        b=iVtyg6Qfl0Bw5vOhFeDrfuWaKFwUmJpIeESeSmvi/d9RJnOpKJ7AOB9k75i1QbImEg
         JoeZx0C45K2dNhEYnnd0CGFeQAtHPZvvbZ2pOy+qkxSPDKVRfAHA8RAe5zXT60zlyltI
         /wOZtCJ9jK9CK+PsJwNn+Hg7ioXn9Ho5NqghwhuJMnRC/R+RALkkJvPMclFWqa0AMYep
         GQ/3v2F6hAJyFnRvqF/LUvVWLrr22tZwzSng/JzqGIdLabiaa6WD4TOjMTQcskQ6UpkQ
         mZytzFONbgwVQImHDCwb4FHUI4i+Xf9pQs8ZGoP40PnTHbqe0bRqYyAs7omN0515eR/0
         UmIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647579; x=1761252379;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V1Ai9+Zzzmk4YgwBbS11BlzZbpFH5SUN3q8VaF2OQnw=;
        b=RZZkAyH2whif+RdHKXgStC9lD+espJv/Ykk1ztsrhEZjfixYUqiiBdoYbwPK5FoiOa
         tEqNy+oZ9u1bxE5PO9UU8Ra0H8h1KftGMAhh6vN0tkEjGRV8w9DPGTYIntuWZXpA48eO
         KuZXlBHLx1yg65DmsYUotBmAxFFSBB6whiu3q6oJtXMkI3w/rUB1J/xUgeR/EYiLLPxk
         +Y6voKPJYdEC+aK8/4PHe6KMesmV7Os9XNNBNJBvQYhyGfPnSK4UfXlL6ayNmVk1vnYZ
         O5SsL6sApzjXDUQJIEuWFw6Xu3zxOfeLtj5QWej8t7ano8Y7lchAPtQLf6BJh3wspEoM
         YV1g==
X-Forwarded-Encrypted: i=1; AJvYcCV7zFrOu+kM8flRU/m+R4rCKynILgNPEEPzDwO7O7VAzHbiopx+vXSBvay8RJaO2VzICiXTKOmfkzbgQg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKn6CoE1h5youk6BoK7H9IsuJk7TAI4ea/dJOQis1H0IhB9WyQ
	5F8JBOQRSLchVXeWwfgOsucwrru4Kt1I3ZZ5M+ZpNnzviM43yocD8GEf
X-Gm-Gg: ASbGncsiW/OK0nS8EZ/OI1CjyiqQDP2qDBoXCgBdt+17aRz1rH1BmHQPhTrMiYxlf+y
	A0xK+eUYbvXfznOIgpRsljp+z5wGUkO1yv1gc0B/UZyV9RAjd5eC+UB6xvgnGvxc6RzeqtwMXvT
	yxn8QQ5iferADWi3q2gNN6qd/EYS6nfU/yc6U6KL8kxh/AvcEniQUI0PzJ8Vw99eh9owk25eRv+
	mDWZklo2CA2UDv7ETP5z9Gf0ReE1+TDoOsf/q+1ffb9jM5wvxdC9r6mErwXBGCPcvV57wT/y9xu
	THlBNGMAdlHXIYhmgXnUM9XXVUkN+pGYViAi/f/zPkhDP3fLt48ffH+6sa2DKxUa7W+on1Ijdky
	sT4E8cSwLnk8wZaIhR1SQs+WmByK4l8Oss9QPCwRPGAAzbc1S4jIV41Q+y64dbG2lcDUdpGTGGm
	Ys6j06nsAcGDq8Wi/VX7ycVNrO+wQ9TsR6yQ==
X-Google-Smtp-Source: AGHT+IE8MMym6AutsMmdioAIvxbR54n6YIfM8R/YQDBc5KW96x9wVJXon8S103zR5uXldC9gv8jYPA==
X-Received: by 2002:a05:6a20:a108:b0:32b:83af:11ff with SMTP id adf61e73a8af0-334a8515191mr1547559637.2.1760647579360;
        Thu, 16 Oct 2025 13:46:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d09d6easm23441857b3a.51.2025.10.16.13.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:46:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:46:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Cosmin Tanislav <demonsingur@gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (adt7410): Support adt7422 chip
Message-ID: <6a4df82a-d540-4927-8708-759680e15624@roeck-us.net>
References: <20251015-dev-add-adt7422-v1-0-7cf72d3253ad@analog.com>
 <20251015-dev-add-adt7422-v1-3-7cf72d3253ad@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251015-dev-add-adt7422-v1-3-7cf72d3253ad@analog.com>

On Wed, Oct 15, 2025 at 03:52:21PM +0100, Nuno Sá wrote:
> From: Nuno Sá <nuno.sa@analog.com>
> 
> Add support for the ADT7422 high accuracy digital temperature sensor. It's
> identical to the other chips supported in the driver so we just need to
> add it to the ID tables.
> 
> Co-developed-by: Cosmin Tanislav <demonsingur@gmail.com>
> Signed-off-by: Cosmin Tanislav <demonsingur@gmail.com>
> Signed-off-by: Nuno Sá <nuno.sa@analog.com>

Applied.

Thanks,
Guenter
