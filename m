Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D737B189F43
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 00:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769473076; cv=none; b=EpOqPTmwv30d95s/1mN+365l+lHj9v6xvxmUiYLkeKzpjYLCEi840YfR8/MKM/INrN2iVgbOxtYPozS5vEvOMHe70vLq2b8Q+8t06HyOKAp7cu24JCrZ2fFg/aaUdqdwWVhuxcLPvu3yccv4lkkthIB9TFLb8dkbn7vBjbpEprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769473076; c=relaxed/simple;
	bh=RpVEtzoVrzSawk7+qHPvsjMhb1DCqqxD9C0qnee1oJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfFFpsJNNxenOnnR2KLmL3l/4yY0IowKxCGrUNIRUFWghsF4clee1qpCjV+OmzlAxIDFYbobB7M2IIxKoOf3E49W9482xFkpuyBrBX5LSj1LqMZhmK8mHNFDUHg59PRWqJjG8JorThBQoJLo3CgCTzZAp0CD7Izo6lm3XdmsQoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OJBPEysx; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OJBPEysx"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a0ac29fca1so38514045ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Jan 2026 16:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769473074; x=1770077874; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=10gNOulRcwGjDJQj45p9YveIo1l7CK5uNMBsUSp82RY=;
        b=OJBPEysxXz5Az/iugbgZEx/dgdKV3ojczzZfZ7POSj9Ni41/0mZPA+SuSH6Qo3iwnZ
         w7tESud5J8hqvQrIbG4o6hX7wBOcVgCzHxBPIqppfdu8DJRquhpMRxy8OB/4rlALAOQb
         1cO4/4Jvpz8qdZnkXaOb3rFG2Cvps64yF1RctsJCgti6lQi16Lb4JFhc6LRx3zoMRsQg
         B+CEH4lODjyH+/OV8d4LCqq4XcWuITRXFFrJh+K11mJHHkkWus4O7D3bCzXaGEeVenLh
         iIr0fP2eoCAHueGI37bBhujazTC7F/zEEhTfVHeUUcn/YSl7U3WNSLP/yaFrKUCGwkUK
         J/pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769473074; x=1770077874;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=10gNOulRcwGjDJQj45p9YveIo1l7CK5uNMBsUSp82RY=;
        b=p+Uirp3iCAjuEltIF64M+yllpImy/u+CwN7atVbs9H2/eXkZJAW6hTlWTnREAHJqVF
         Xt0Z1EsjP32wTQZGF5iOPZ4h1P0Jbafdu+Gd6/dztw+BCBZTU9JghIRTXLag9AjxkJZN
         vtZxnNP3gNuCesjDIPrlTntriWpxUU9Tunv3CKtl55RaanMg0OVZuxjsQIvvo/sDZDVt
         5pB8m/RRTq6aa6RzJ9m+znACTwl+/1jfShG+5Hhy1IiptZZpihPh61u+monYlOv2uMEY
         v5XaJCW1tLSlh5yrUPtcAN6DJf3G7n6/S+/29BUVTZ3mprgzWl9K4VJqpWEmISazOOSj
         +mMw==
X-Forwarded-Encrypted: i=1; AJvYcCVwmnHfNcmwvXJjncj9afvUEJK2pdZu/Jx4+HOnA1IqYZmTPmVvKFoZBOGd0DARqzC3xnD7wKlYe1/x0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/6S/I9MubS8IbL6yPh8VeilDKXjc+FZ2r2MKgRNFy1y71O7zQ
	in9v9M0T4zKQu2aNULhIDI8EWkrsjeSDekMN1YckviAN7fGt0Ej0mQeU
X-Gm-Gg: AZuq6aKeholmWvmsC2w7F53F51mojLlUirs3Cwxh/LoW0voSxQ9oU6mNP1oPMAf4moP
	UHappFCz7T7mW/+Xys5ISpgOv1Gb1KyE8a2dRVMZFE9eOnqgqZPBjUAJ+Ug8qo0bSeuuJVfSfsS
	L6e6L3JdK7HAC4ylEp1CMpOGbaZVNcp2oLgXG9okwFfuyBQaIKNkjJSPd6CDFoFqKLi8OrtwXXh
	SSSNcxdJu242FZJbILTsCjx3ttDsGSzplocKpu3N+Lxq6cxuixBynPAW3TQFyKrDG9QMlmrhCVW
	15bfyXuF8OQllNC23pwwz7t2uFe6KgoAT1W2P9jpeAjpyEbEuZSWQCe6OmGcYhdMbdNIN1cJYkD
	I5BFKqh6vz4pPduPOmMCqMSa7DhcqYt64BclvvhQ7TNxBzc/MarenUmYYhXYmZWXZLzNkgd5AwB
	S258LScZuzwNhY72jaYRDcO62b
X-Received: by 2002:a17:903:19ec:b0:2a0:d5b0:dd80 with SMTP id d9443c01a7336-2a8452f3833mr59109575ad.54.1769473074110;
        Mon, 26 Jan 2026 16:17:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802daa79dsm96600305ad.3.2026.01.26.16.17.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 16:17:53 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Jan 2026 16:17:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Mayank Mahajan <mayankmahajan.x@nxp.com>
Cc: corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, priyanka.jain@nxp.com,
	vikash.bansal@nxp.com
Subject: Re: [PATCH v5 3/3] hwmon: (tmp108) Add P3T1035 and P3T2030 support
Message-ID: <1571386b-8b67-492b-9ebb-4aef08885fe6@roeck-us.net>
References: <20260119040459.2898998-1-mayankmahajan.x@nxp.com>
 <20260119040459.2898998-3-mayankmahajan.x@nxp.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260119040459.2898998-3-mayankmahajan.x@nxp.com>

On Mon, Jan 19, 2026 at 09:34:59AM +0530, Mayank Mahajan wrote:
> Update the hwmon driver documentation for sensors: P3T1035 and P3T2030.
> 
> Signed-off-by: Mayank Mahajan <mayankmahajan.x@nxp.com>

Applied.

Thanks,
Guenter
