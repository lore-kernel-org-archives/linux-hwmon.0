Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FB928F92E
	for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 15:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745334185; cv=none; b=swGsIFZW80RGzgVfTlPizxw39Ud8Y/3YvLgZpgEbkPAQY7gmfKgxgHz1Un/44WHJ8veHYHOZRt+Fw8XyGnHDNggEdAHkF7pX9MLrak0V8AufFwy6hmbxIKjc/oB1kCbJpG3/9bqvJi4MUI7vgdG3NYeAvTEFbBgBMgv0/Vr/MFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745334185; c=relaxed/simple;
	bh=a9oHiuIRd+Lat23wgyOLQVKu0davNOYNyV1lqgu94Hc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aPqEeTV4eLCudbxLMvU8No/l9810Z+FXTF9QYvvfHuyA7KEoOXi9wcBGzzmzR71S/1ncBcxe9A3hq1cNrFvCF631wvRaCYxVBLSDOO7lqpvAkn8PxRnt2ucoioaiN5IWsXxcjLSqSH8aiG3wwM/yjE2imnJvaDPHz4bYf460UoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I6IV+lrb; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I6IV+lrb"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff798e8c3bso4464197a91.2
        for <linux-hwmon@vger.kernel.org>; Tue, 22 Apr 2025 08:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745334183; x=1745938983; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR743ev6ExzRYE8cINx+AM9cywgAmFfoIc+SqezuNJU=;
        b=I6IV+lrbYv0t+bvIaiG0TbVyWJT40Lj0vRqcLzc3/x+0dcZml1AnFM8HQY5Ii0wkCK
         EFI9GLLncA7Nf81PeY4qYgGpbEdk6GQtvjHUrP43uS7sYSItfs/Hp/W+equBtADhN9iR
         H8kGG/d5XAZylKSAL++q+ioYsECrBM0IYZU7VUdqcrJGhPa3joqiDrIgBusCnfsOOjmZ
         /a1Dr6t8bvSNSFRCHQvERf4r1hilrZRf/fX4p3Lkj5VzPiie0d1c69yQE2wP4ATTE3E/
         J6p2quspRGpvtugOYU1sLARWmrmhAeltWiFl33W2BwncgY4q3qCNTdFwpdJXyCO/Kkkj
         To3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745334183; x=1745938983;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZR743ev6ExzRYE8cINx+AM9cywgAmFfoIc+SqezuNJU=;
        b=jsUYy1/ado52+97kOhw/pzbeF90VruqrfOt+2PYfzgI/0jWE1PIUF1UT3hM4bFiDlv
         RdcrcIm6mXbtIkh8hG3Vq0SIJkL0KfcygAuRtd8PpIArXmym3ZgUrSyYrc/LYK3xmFV8
         bpxbA35SPO+euVZBd1BSRhV9QJywudd8YQSr70dqC5aRgPkU9BI81si6cMIRETgEf7Aj
         I87WcRh5S2Hcj2leuTrdE4qJ0MlaFKpX6wip2e+Yy8X7Amjvr8tc95M7uCmHAIkciYFb
         4cThR8S9MX/SDclmJmAio+KwPyLikKd+W6D6yG7MZUyzScpQbugt6JfFPu2/I4Q7W4HR
         SVUw==
X-Forwarded-Encrypted: i=1; AJvYcCUuCdZmKUXvHAo0Rpe19NztkZvT7hDTarwCt32AZstdkK4vFtoBNqWVMdjdwYKto935Ltn3lM3UWpQ1Ng==@vger.kernel.org
X-Gm-Message-State: AOJu0YzvtzA3+05rlOgBX9CBgvgtvzK6s81cK62iJu+1Yj6dru6oW7W9
	tFf/CO1s6jnIEU87goMIBU23CrAjvYScxb3RjFloB5f/8tU6hLaGey/o//BC8YXEp+iBbLhPBJp
	Clg==
X-Google-Smtp-Source: AGHT+IEIapJZJRM9UWSGs3HX5eEFDXXhucM1QTXJfnPOK/9YTrDfsNmQubNfg9xjcSY4LHTjaYmG0pXn5/g=
X-Received: from pjbsn11.prod.google.com ([2002:a17:90b:2e8b:b0:308:861f:fddb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a0c:b0:2ef:31a9:95c6
 with SMTP id 98e67ed59e1d1-3087bb56439mr25794718a91.14.1745334182926; Tue, 22
 Apr 2025 08:03:02 -0700 (PDT)
Date: Tue, 22 Apr 2025 08:03:01 -0700
In-Reply-To: <20250422082216.1954310-1-xin@zytor.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250422082216.1954310-1-xin@zytor.com>
Message-ID: <aAevpauKYWwObsB7@google.com>
Subject: Re: [RFC PATCH v2 00/34] MSR refactor with new MSR instructions support
From: Sean Christopherson <seanjc@google.com>
To: "Xin Li (Intel)" <xin@zytor.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-hyperv@vger.kernel.org, 
	virtualization@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-edac@vger.kernel.org, xen-devel@lists.xenproject.org, 
	linux-acpi@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, acme@kernel.org, 
	jgross@suse.com, andrew.cooper3@citrix.com, peterz@infradead.org, 
	namhyung@kernel.org, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, wei.liu@kernel.org, ajay.kaher@broadcom.com, 
	bcm-kernel-feedback-list@broadcom.com, tony.luck@intel.com, 
	pbonzini@redhat.com, vkuznets@redhat.com, luto@kernel.org, 
	boris.ostrovsky@oracle.com, kys@microsoft.com, haiyangz@microsoft.com, 
	decui@microsoft.com
Content-Type: text/plain; charset="us-ascii"

On Tue, Apr 22, 2025, Xin Li (Intel) wrote:
> base-commit: f30a0c0d2b08b355c01392538de8fc872387cb2b

This commit doesn't exist in Linus' tree or the tip tree, and the series doesn't
apply cleanly on any of the "obvious" choices.  Reviewing a 34 patches series
without being able to apply it is a wee bit difficult...
