Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792973486;
	b=lEdX3d/hChjj2Bq62dhaTv7wIxMCObZ4TGQpIcJObbeRox7CMmMXahxF3dtQnJ1eCwru
	 g3PBs3lBcqd9tgZbOfyNyM69FGJX/gCgg4C6f/q4r/ZLgmjlLrfcRmDl2JbErOEMEMhr0
	 niZ9m2I08XYohpmxl1qkgRWkivTYcNhtUXaR9ndGWNU3DHI41QFwAVhLqoNem5klRlNPO
	 w5BPV7smYHl7zC5wvoFF/iv1Xj/yQgstFeVPYnGhkJyAalYRKhVpEdLODafPyuNb9bZhp
	 LnabDRHYa0NQuX+cAJAcfEh7TZLmpBPUlC/OaaeX41sSfCW1pbeAOtDuWJPIHc1rd/Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792973486;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
	b=ZQxyX8FzD4GkwZ+c3LptMtLPB0srnYU2ApQ46wp2RJjV9gcwU8HlY0tvxdRi+STpVb6o
	 +/Ikbd/3w2rB8utQH8/mFolPLXuWK+l9zEefENCNxSEw46cM/u34Abss7meV1/RxNbpRa
	 Oxnrp23TMh7J1/TTPcs0phWut1uVeX0BHUNrRCDMbJ9XVZdCS+zRnRPxgL0ZnkxpZHvX/
	 PjuGkbZihBPXUQScVM69LlKk1e8+XuNjxZvfq9Y4iEjD6cWH9lMagWfa2ef/TDdazTZZ/
	 PJHjatsFvVQh9YNV0eincrj61IwRdb7p7rL+JqPan1fwDrFmCH9hdtvlPz4J6+TW3LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDxOh0a;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E78A606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:11:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E78A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=CIDxOh0a
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acd21ba21aso1878808a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792973485; x=1793578285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
        b=CIDxOh0aBDi9vhnbv39eP8/prDff34JlyHFnFhvzxyJuajci3zsYRmfCEDMWrFmB3H
         2kWO9Mn/w9sg3V4Nf18mMKuuTkni5CJP5x449iUU0sB6x1JqSrR09KTrEqtI9f0OuO+x
         rDyElSpnaMhn/SHOs+X5LcWR6vSU/W2G2vsZ+hmlVQUqlnCSkzrO8bqgaWosHpY3VsaR
         Oe69ic+J3mPxwQQQ7XucgqBvvJkYvOiTuDNO6MsXygLjk/efXwwK12nFiIY3ykCbj97k
         QTmt2rkG9vZhoqFtXUmrKDAbvhzsExE0DLPzNCZg3ivGWeMR767bK31bYA97VFfed+He
         jO6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792973485; x=1793578285;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BWagrlhFdDZGDo+cojLbvcpkaUCoJZ4Sw6tenHlxUP0=;
        b=KDWyKdg35Cykjl2YJv7d59qiHwMAa1PB2GsNvC+4acn2vkTNeWUmQQ44RGe55pH3O6
         hYUxkzMme5KgI5O2RBzbcVP0sCsyWYBREv8jCH4S4SYmL1JkfYUO4xOb0gqZJ/+Z/v3Q
         A01wJKfwTOdcdB37YmexFPIILjibHHif0TfbTR0iIzJ2tBn4MpfNGG/XdspngvdNItZh
         dvoPyfbwKytf9OMofdIK85d5w1MmTQ40eMdMP+EftbPvWWQjdNHautIkFqN7Flxc5e9D
         7WdfTpwNoyh/sN+6ZIUMsgWJe5t0IZL8DfS1wkiT8cxS87PSwC2ymlif6PK2X2K0vk4A
         llKg==
X-Forwarded-Encrypted: i=1; AKwUvByNLefJuEIWrWA+5Wl1FEyMUM1URXlHwNPDhmunvb06fnLhOvfRwgmM6mu0dTfMNE+WA+FrJIIDqxq0/A==@vger.kernel.org
X-Gm-Message-State: AFq9FYIouXjIDvyeSR8YHH341eQ6YbxhfqfSfECy9mHonkzSysrxj2KY
	yajr+2NC/5YPAnQoSOAylz6khpEhPqrV6GyjOPFBZtl+tGZXDgxkD9fQ
X-Gm-Gg: AYBFou3pZc+I24RlwNtwf+xlFJhh9aNfSbi1Gkck/PdZtSr088TQWfqcZWuzA1fRxgP
	oEN9Rxr+YoxqeQJIlo1jxoovk+qjxwa1SzqrCNqv+Pi6Rbvj5tDtsUp0zeTKJUBjvZ6wbmkkEY2
	LHZ1qfiZ6f7yxN598Z8+tZEY1X7QQkH/tE0o6V99pm1i6rYMXY4AWsVA60eOpPFZ8w9HMnj0AAt
	F4mvxKSfnPKpOtMQ3stLCNZndoxbbG/MX5w3rTqD9V0m2M33BdUGpR3aB1RN2MkH0ThSYaYibiW
	kaGyJHzC/Q4LhAfWcg/zwOpovi8B3XJrtHHMjHDsO2Z3392RHuSzLW9YfTOeKYMt7meNnAd6hUc
	s9f3EObEZYt/skmg2Lgu9Uy62fWzw6qIYzm/D2Dj5ucGuaIJ8Xkm6SRQohJ63hCS7INQAs9evNw
	2nQPZG8E4/WtAkMjPuUy/4ZWd3MuYs9uuH1MfZjLRzoIBMLDjKOXSlMMCpoCJjWax6sM9f7wkYs
	enjipsY4Z6ECCmNmc2/fA3LRmi47yQ7l3TSb8wCTCQM7La+e/Elr4gog7ebx8tPHlC5bAabmTOb
	HndO6K7aGFMoq3A=
X-Received: by 2002:a17:90b:3dc8:b0:3ac:adce:60c5 with SMTP id 98e67ed59e1d1-3adeac07ed1mr4524637a91.23.1792973485449;
        Sun, 25 Oct 2026 17:11:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm5994393a91.5.2026.10.25.17.11.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:11:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:11:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Cosmo Chou <cosmo.chou@quantatw.com>, Andy Chung <andy.chung@amd.com>,
	Ninad Palsule <ninad@linux.ibm.com>,
	Abdurrahman Hussain <abdurrahman@nexthop.ai>,
	Robert Marko <robert.marko@sartura.hr>,
	Delphine CC Chiu <Delphine_CC_Chiu@wiwynn.com>,
	Daniel Nilsson <daniel.nilsson@flex.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 00/31] hwmon: convert i2c_smbus_read_block_data() users
 to pass buffer length
Message-ID: <6ec548ce-dce3-4a13-a34f-ed7d66b10c2a@roeck-us.net>
References: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261024-hwmon-i2c-smbus-read-block-data-v1-0-e81941ad0cd3@gmail.com>

On Sat, Oct 24, 2026 at 08:06:03PM -0700, Dmitry Torokhov wrote:
> Convert all callers of i2c_smbus_read_block_data() across the hwmon
> and PMBus subsystems to pass destination buffer sizes, adopting the
> 4-argument form introduced in commit 68f382641f8c ("i2c: smbus: make
> i2c_smbus_read_block_data() safer").
> 
> For drivers that used intermediate bounce buffers (lineage-pem, lm93,
> and pt5161l), redundant buffer allocations and memcpy() calls are
> dropped so data is read directly into target structures.
> 
> For drivers performing string comparisons on the read data
> (acbel-fsg032, bpa-rs600, ltc4286, max15301, pim4328, and stpddc60),
> ensure the destination buffer is explicitly NUL-terminated before
> comparison, and pass a length that reserves space for the terminator.
> 
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Series applied.

Thanks,
Guenter
