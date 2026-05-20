Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D06296BD3;
	Wed, 20 May 2026 13:32:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779283947; cv=none; b=PN/N/i7AsLohhssUb7LAVWCon9DjoWmQaYFiAUeBNgrYYTdLzbbefJSqjG0d2VNsmpu8LOfK2wZEk5u27H6GMgPANEf2j2OWm0mbQnv3wo4YztQtC4NUhbyZeL/ajZwoH/ebJ0eottDjkQ+RwB1JKyjJmbSsXV3O4ZBcykW+ySU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779283947; c=relaxed/simple;
	bh=ihilbjjcC733dUYjEt4I/oetk4Gjty5wKhH9j1S4UtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V8sicihsSYUp24hT3P95z8HTzgkmaTG/skQuK/VlH9v2cV8XJ91sGkuHhNJIvbwnqvD00KK+T8mqvsXk34kBxuuo9XZjtjwsHc4NhHuXzj55+RTQCUc2aVKZJGuEJApF3nJGoePNJfz0WeGUAdlNooadyTS0++qBgAKASNoWsQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZAGNvIn/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZAGNvIn/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD8B41F000E9;
	Wed, 20 May 2026 13:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779283945;
	bh=kHtf673Ra0gSqzgxWX4CYOP0Cr4ZHMxoc34qQIAHQDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZAGNvIn/yCffLxHOfmhpMJozvEkabTF1B+G9fpbbzPnInK6JfidMtWz74dCmY3Qup
	 sO+iko6ZkMWrwO8Hlgc3/8ErXToNMXaYBZO8c4aFKdurBak+rAcuJMjXXqpTNDVMC8
	 EtlT+B/N1lP6xvvGbj96ggrYktvFg7Cpqt548Fl4U+wsWPQtytnubbhUqPosGKDj7K
	 weTRdRvdFJ45zeSv3+9X1hm9YjtnZi65WIALDrNwLoEPnSi/ztOg5MfejZnYBqjEnW
	 kT5z+uHYAE6xpGbQC0+jvsV0Vns8ipvkEwq+9eQ2dmVsYcP7VTrjlv1WCpoWi24+eH
	 dj7h8VXz9lCMg==
Date: Wed, 20 May 2026 14:32:20 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: "lihuisong (C)" <lihuisong@huawei.com>
Cc: Adam Young <admiyo@os.amperecomputing.com>,
	Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>, linux-hwmon@vger.kernel.org,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	Andi Shyti <andi.shyti@kernel.org>,
	Guenter Roeck <linux@roeck-us.net>,
	MyungJoo Ham <myungjoo.ham@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v02] mailbox: pcc: report errors for PCC clients
Message-ID: <20260520-optimal-nightingale-of-champagne-0bbdfe@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
 <20260519-outgoing-rough-fox-04daab@sudeepholla>
 <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d719462f-3430-47c1-9b9d-1068b3c4e429@huawei.com>

On Wed, May 20, 2026 at 07:53:45PM +0800, lihuisong (C) wrote:
> 
> On 5/20/2026 12:25 AM, Sudeep Holla wrote:
> > On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:

[...]

> > > @Sudeep, I have always had doubts about the addition of this line of code in
> > > the
> > >   commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
> > > The patch seems to avoid the timeouts in the mailbox core according to its
> > > commit log.
> > > Regardless of whether the command succeeds or fails, each mbox client
> > > driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
> > > call mbox_chan_txdone() to tell mailbox core.
> > Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
> Which controller driver?

git grep mbox_chan_txdone drivers/mailbox/

> > by PCC, so not sure why you think this is not the right place to do. The irq
> Because many mbox client drivers call mbox_chan_txdone() after running
> rx_callback() in mbox_chan_received_data().

OK, but why can't the controller hide that for the clients ? What am I missing?

> These drivers doesn't set chan->cl->tx_block to true.
> It seems that the client driver having tx_block need to set
> chan->tx_complete in tx_tick().
> Do you add this code for them?

I don't quite follow you.

> > is to indicate the completion. I am confused as why you think otherwise.
> > It is defined in include/linux/mailbox_controller.h for the same reason.
> > 
> > The client drivers can you mbox_client_txdone() if they wish to as defined
> > in include/linux/mailbox_client.h
> mbox_client_txdone() is used in the case that txdone_method is
> MBOX_TXDONE_BY_ACK.

Yes and agreed.

> And mbox clinte driver using IRQ method need to use mbox_chan_txdone().

Client doesn't handle IRQ its always controller driver and client must have
no business to do that IMO.

> It seems that all the current client drivers are used in this way.
> These interface internal would verify chan->txdone_method.
> 

Yes, sounds wrong to me.

drivers/acpi/acpi_pcc.c
drivers/acpi/cppc_acpi.c
drivers/hwmon/xgene-hwmon.c
drivers/i2c/busses/i2c-xgene-slimpro.c
drivers/soc/hisilicon/kunpeng_hccs.c

It is very clear from the code in mailbox.c, mbox_client_txdone() is for
the client drivers and mbox_chan_txdone() is for the controller. We need
to fix the above list but I need to check if there is anything I am missing
to understand first. Please let me know.

> In addition, I find that you also modify the txdone_irq/poll in the commit
> 3349f800609e (mailbox: pcc: Set txdone_irq/txdone_poll based on PCCT flags).
> The txdone_method will change from MBOX_TXDONE_BY_ACK to MBOX_TXDONE_BY_POLL
> on the platform using poll mode.
> This may lead to the original mbox client driver printing exceptions in
> mbox_client_txdone.
> I haven't observed it based on the latest code yet, it's just code analysis.

Right, I do remember seeing something and wonder if I moved to
mbox_chan_txdone() in drivers/acpi/acpi_pcc.c for that reason. But if the
expectations I have mentioned are correct, then we need to fix the framework
to avoid throwing that warnings.

-- 
Regards,
Sudeep
