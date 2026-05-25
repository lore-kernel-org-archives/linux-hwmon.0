Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40C3E34D929
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779732780; cv=none; b=HGj+OqZ3Qvv/mItPw7RkUYlJvLKBFrMTULueJfuJzkSiT8Qj62G8S1CjfBNFI8dz03DrNqKNC/f3J5QjlbNTREtRmUyjlr1hx47awYzC0R8hXhcWlY2O4Ms00T8LNbO0D6hIrOxOLA7+pK9UzRUWJW4k/tvJ8wPdA4oL16Y8jKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779732780; c=relaxed/simple;
	bh=9jf9tLHFxQ75qHMj/kSwRfxynqtrXqLlCjMLgN/GnyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4cF+BKbfNhV+gNPDTXY50dVo1ap6Tyd/Mo/EZ9UEkTFr7IgddMghNzcgh2t5tYiJw2dXotiEu1LSnWWPcoZUl0bifwOyYju/hKVf0ygaAC5y6HlJ1ygv4JzgvUrDCSZ7U1QA8wX927p6T5Q8jp4lF8GtlR3n2u+N67VE0L0L40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BWkIJ6Cq; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BWkIJ6Cq"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-44e1ebb3122so5983591f8f.2
        for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 11:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779732777; x=1780337577; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpFDzkjuQFRbiLFIKfVeYLaVXgVS8IsCkc5nauULr84=;
        b=BWkIJ6CqeqnyUFmSh61j89ToZvfwSxeKsl/fmGFVoyB4U/e5xpeQ7xDqWbItUfzndI
         S0GWD7zANNE/4SzISXSo32Q5K9eqOtngxem+oFV0mNY9lgMU9KoUTYMWfDvVMBMzCh1h
         hg9VjIgRJF5HHAPm1WBZgnsozUG1qejbedGHbmXqAQQeydDxwSaBidsYqQDBIZTcD3qY
         Of68flK5xNbrKIb3hzuPPvmqppvNM4xIe9e02CsZfimpAkDrzcpm7RVfVN0RjAnn0Bmi
         IT6iMB8pPeHdrFcBb5SxTtrgpMs3LlMm9FKFKmq1IjmfgD/KwqmJ1c8nvdsMPNQ7t9or
         FFqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779732777; x=1780337577;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YpFDzkjuQFRbiLFIKfVeYLaVXgVS8IsCkc5nauULr84=;
        b=ImIKZTMUkb2f/MgCuFRLZ++4/Gj+Sxx8qnZMaUIcpvGzNIrdBRDqmNKD+Yh27o4Dw+
         YwXyW7AJJ/cUbS9iQK+/JkZ1eLvStqvopkRP9Dg5aedzjVemyDZ55Qy1CBd2GGKQd1kn
         ifFgHGt8nyzpRcdGXSOe1xm1wJHdDCbrH7uN6J1Pg+WfI6DOF5gT2Ld8PS4c39S9sQ1J
         ecGy3afdIzZRduoHt8OLW9JVkWF2VT0ryRQmHNR2roU6euz4+fKxOd02DE2YIxDczJNp
         wDQso80vFIqXsWB43S7WPSM2WAEfkDK20ABad8eYX6QS2Ss4CwjGxXElSpizitl6tL8T
         XWlg==
X-Gm-Message-State: AOJu0YyRaGGhOlPCO46v/DC4PxR5WEbQxgXJyMyq+TnyqVbvDEOB3sc1
	c+9Dx21aL6LO305Qu+ijog+bBKhF0Ve+oCMbbUX8TVJGSGA4eaWD8n5HDdP3zvqI
X-Gm-Gg: Acq92OEWpKEVKXvq0pV+jGq+gqpUw8Ia1oTGo/g1g/vEsIErRhpd1id7NeYSIBBPYWP
	v8nceaAFE+rH/+Amb0AAzrphrDgGw2fXatLVvIW8DkZAu825x8h89TG5WX3I5OkYdE7f/247BuB
	pJXnNsikxJ9C+d8SUYLvE6cSxo0x0yQOW9SDCzZp60eP9XfyrFJ0I0/EXrD54aqhdyuoB3Ki7wG
	5ZyzNKXg54SvbXAQIgTtG9tulB22iC+ndxaVXODkH+V2TRfXztQBxorJvhiIfV3aOCzdrXw0BHv
	7S4Vpa7sZrX7/lR4uW0FAShxz4TcW9mtgNUSnMjxli53VNbaWo2xgU3c837U5xl3H5R1TerijMl
	6AbGog3ReNZUaGle2+mZ/dDxii4Iy8j6J7KlmrkyFWAzxnD1kmetsZ8skSqgV/ZZg7H82+9JZ+a
	eXF72EjHM=
X-Received: by 2002:a5d:59c6:0:b0:449:c1e8:7655 with SMTP id ffacd0b85a97d-45eb39e1e97mr24856535f8f.27.1779732777297;
        Mon, 25 May 2026 11:12:57 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6ccd211sm36623653f8f.10.2026.05.25.11.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 May 2026 11:12:56 -0700 (PDT)
Date: Mon, 25 May 2026 20:12:55 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v3 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <ahSRJ7neNt9sncN-@localhost>
References: <20260524210545.1333637-3-sautier.louis@gmail.com>
 <20260524224927.EA8CB1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260524224927.EA8CB1F000E9@smtp.kernel.org>

On Sun, 24 May 2026 22:49:27 +0000, sashiko-bot@kernel.org wrote:
> [Severity: High]
> Could these uninitialized stack variables lead to memory corruption or
> information leaks?
> 
> If the firmware completes the config request without a reply frame payload,
> the underlying _config_request() returns 0 but skips populating mpi_reply.
> The subsequent config read request relies on mpi_reply.Header.PageLength
> and mpi_reply.ExtPageLength to compute the DMA memory allocation size.
> Using uninitialized stack garbage for the size might lead to unpredictable
> dma_alloc_coherent() behavior.

In _hwmon_read, I declare mpi_reply the same way every other
mpt3sas_config_get_*_pgN() accessor in mpt3sas_config.c does.

> Additionally, if page is not fully initialized by the hardware response,
> stack garbage might be returned to userspace via _hwmon_to_mdegc().
> Should these structs be zero-initialized?

The page argument is zeroed by _config_request() before the read, at
mpt3sas_config.c:344 (memset(config_page, 0, config_page_sz)).
The bot's own review log notes this: "the code *does* explicitly set
`config_page` to zero."

> [Severity: High]
> This is a pre-existing issue, but does calling mpt3sas_config_get_iounit_pg7()
> expose a data race with the config_cmds state machine?

This is indeed pre-existing in the driver and outside the scope of my patch.

> [Severity: High]
> Similarly here, can the uninitialized mpi_reply and page variables cause
> the same issues described above during the config page request?

Same answer as for _hwmon_read above: mpi_reply matches the existing
mpt3sas convention.
