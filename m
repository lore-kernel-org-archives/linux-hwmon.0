Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5CC2773F7
	for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 15:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760455004; cv=none; b=d6xYbhbiKMJkq8G2obWW189BUXKuzMfwZ+uyxy1FdfpxkrngfxiwYNPTTLNlD5zm+yREUUDA/qI+lGfo6imBBVk06szvkVFuH27hS/gDm8Y7XOYAmaMmskdmNRVeQIIkeF3JU6XtfkF70jORt1fZknKl21aLKv0KVi8HlTtMPPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760455004; c=relaxed/simple;
	bh=jTNDcxqogKVaZtvPP9YOb8ee/Iyh6X79+4lxjhYUQz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=azUhPSDB9ebLCtq+TxGI/TaPeQK9fchB4JJe9Yl+pPCDLj8oXVh4/6a7hI94uMpz1t8YtuevflXo8046Ty/hSKS6+/fT1mEU5+RDHTHYwQW0NTSWLcZSVJN6DizxBDALSfOAwmpA1xvGCgKWJ+/YTMVIjZDiFhb7S+me6i8j8Ks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PF4M0m0o; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PF4M0m0o"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b553412a19bso3451279a12.1
        for <linux-hwmon@vger.kernel.org>; Tue, 14 Oct 2025 08:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760455003; x=1761059803; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Aftt5GDndW+QmwWYyCYRVm3iyK5ExICkKwljxAsMHQ=;
        b=PF4M0m0oKH0NTF++WbMmCI08mVlAkrwy17vAlBqnhVZaukdF0Bg34TCX5/QTZnq29d
         3P1WH50SdOV5c7Z7oyS1yiHAC1fnW1vCwCGhlVVPz8GPNiP80RWbmwK0ZhOQ+vUlhcLb
         q1EWAHWRAftTbkmgG8s6zBOLZbF2AsRlKKAlUOp+kL/pXSRGwH9G9AgcrTbUgT2eH/UX
         VLkNayRVkL2KMNEtbPhy8f8UW1HEar7JQLx10G946ovCDT4Fl0lemdxAgSqXJFc1OXkm
         daY7xDbrnO854MYm0GY3HxlsjKsckTYU1MHjitWqCZ4WSS1GIa1JYLx9kbUfHqYG54GR
         r6rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760455003; x=1761059803;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Aftt5GDndW+QmwWYyCYRVm3iyK5ExICkKwljxAsMHQ=;
        b=kuZSyVnoNC45ThE/pF1cpM485duv2scMbK+XHOw2bS1C7GAjOD6crDMg0BQ3RJR/aK
         jFzkYfJbB5fZpm2qlQGRQBCaytUC3ylefPzmlinOX7o9U0i/NdIgaNAMA7zZfsCERcUC
         QrYWMSPF/QxXJBDwF3UxKdRx5hqZKmiiQPMcJ9+F/8d4p/CMdeEZQXoW629cDFVlnFp2
         y0ini0lpjEZEtnX39BRARURoh2k977w1+1mBtpmFxwGvrxDsO4HvEpcf/HlIWP6sNTBB
         aFb8kHIEvMqNi1sJU7GPLAoWSfGTvhu+g3GzO6hkjvYK/fm6ykCBiwMmwDRmgsnZTUG/
         lreA==
X-Forwarded-Encrypted: i=1; AJvYcCUKPReL+X0jtR5KERQ8NPDwdee67Q7Hrr8JoIvlK3woAMxjOi92qNqqt9zgd46v0qClcDQj80YwX0Ebkw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy32mFf20EVvK+40gF6bSHG4DFI6sNkWB74D2EzX4m1qOixDDsB
	gFkWG4JFmO5kTi3wJkTZ7yRtMjGC2gMujvsAW93s3boxLdDM8dbjRaWZ
X-Gm-Gg: ASbGncs8bXYXdnnNBzuwsRZAovfk+8LnNlzkS7LsZcaH2EAi9xm7M8pJ/Lmfxo1aZqd
	zTWVGG/OPrKoSJu7JzPFCJdy4fMjBOj3GNMK3vrwYNoSG1PjrY5aq3EKEHeyLpyJ8tXv2Vaw3ZS
	w0UoGqRB4BoCPhBqf5PV2uoTfILOdfAQPEa0avwuKT3wmsKyhl55cRRSm9p617l8AVsBkiYcKvI
	QALfVi4N81CEmUu5/YGiURYH/BTk9xBAgb28VvtJqy7xmxQbVbTSjDlyxnD67dF4lrEQV38AH/T
	MBJDo25j4LjbQRblkmA/WZWuAY0UY4A8WbFQvyfK5JFtBRRHjKgrHW2Tys9MqCF1RIOwfUrFwF9
	WiRNo8OQkJ0ehk9ZG948/XF9CLGooZAWnDgH/MHh9YmUzGQrAu7dZhfNJWO4zTjUhZ+P7mw0jSc
	w=
X-Google-Smtp-Source: AGHT+IHcO0k1gdRh9Ik7VrSifzpnxsBG8UUPfwEIqiLV67RhkTa/m4Z90iP6pclDPdHI+s5aAf32eQ==
X-Received: by 2002:a17:903:11cf:b0:269:96db:939 with SMTP id d9443c01a7336-2902741f404mr296208995ad.58.1760455002711;
        Tue, 14 Oct 2025 08:16:42 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f08e2dsm166399205ad.74.2025.10.14.08.16.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:16:42 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 14 Oct 2025 08:16:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cosmo Chou <chou.cosmo@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, cosmo.chou@quantatw.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: trivial-devices: add mps,mp9945
Message-ID: <9ea2885a-0b86-4166-9a24-e7aa7918be23@roeck-us.net>
References: <20251009205458.396368-1-chou.cosmo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009205458.396368-1-chou.cosmo@gmail.com>

On Fri, Oct 10, 2025 at 04:54:57AM +0800, Cosmo Chou wrote:
> Add dt-bindings for MPS mp9945 controller.
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Cosmo Chou <chou.cosmo@gmail.com>

Applied.

Thanks,
Guenter
