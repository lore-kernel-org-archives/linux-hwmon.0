Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A97C408000;
	Tue, 19 May 2026 16:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779207935; cv=none; b=qj9Um+p8rEi+KgwhcHCCcYOdMCqz+Mle35rjrcDTPkFFdeI1F1rLmH/lVwx5OIalIOVRxhZBIc96m5Z8mE9p3Wy3x1jtVmX9v25JZlnu0AMjKrv6Umgo9gQGFrnPNzgC9K2xQVbDBCmopgKWrpvpr8/r/BO2oCLfy/relyk9CtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779207935; c=relaxed/simple;
	bh=A8Im1bNcESttGU6wM6vV6hVj+DqKwcO+0RA9AjCYEqA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OtxYe7WEmNdDkoQFBtNbjUu4Muw/JCQtJj4R7aalk77Dqzc8nP6Jo22v/PlCDfC2+lUGbQLm+m1Z9/od8JQdPLkuZ8Er7kq/MLQKroiMoGD2pcjyjF4Qdp4av10WuXfubZB7p6RJJvLAHb3TmAT5gXHBW+wVzTnu4gnqHpAhWoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ea0Vue0o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ea0Vue0o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18973C2BCC9;
	Tue, 19 May 2026 16:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779207934;
	bh=A8Im1bNcESttGU6wM6vV6hVj+DqKwcO+0RA9AjCYEqA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ea0Vue0oFYz82kIdNJzi/3LvqzJJ0xs5CpRQYpcyFaehI4kv7iZUN/QomE8atbhon
	 McfAaKg83dNbTZJyifkrHLV2PXjz8VuAUQGLznJCnwvetUehVZqdopAALV0fX7yJZ1
	 mMhwVdQiiP4BNQghG2q8qsiD1kc0dN4DroS91o1H9wfxl11blTatRG8PPt6ffnmHZc
	 wDk0hN3m/vfQgfykhVkC+pQWkx2T09ER4fzEKHsjTwlEx2JHMG6w2zd+Ef2sE76dvI
	 HD8xBpj8H+2NYcDFqyYL5EjQepSW1pQq126Cyz+HmKeuFh8LbY0ARh0Jo65bGENwew
	 pN/jlBzwqsx4w==
Date: Tue, 19 May 2026 17:25:29 +0100
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
Message-ID: <20260519-outgoing-rough-fox-04daab@sudeepholla>
References: <20260518193006.27425-1-admiyo@os.amperecomputing.com>
 <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <881ec4ba-44ce-498d-b0c4-8c1d51b13cc3@huawei.com>

On Tue, May 19, 2026 at 09:54:47PM +0800, lihuisong (C) wrote:
> 
> On 5/19/2026 3:30 AM, Adam Young wrote:
> > The tx_done callback function has a return code (rc) parameter
> > that the tx_done callback can use to determine how to handle an error.
> > However the IRQ handler was not setting that value if there is an error.
> > 
> > The following clients are affected:
> > 
> > drivers/acpi/cppc_acpi.c
> > drivers/i2c/busses/i2c-xgene-slimpro.c
> > drivers/hwmon/xgene-hwmon.c
> > drivers/soc/hisilicon/kunpeng_hccs.c
> > drivers/devfreq/hisi_uncore_freq.c
> > 
> > All of these only use the error code to report, so they
> > are expecting an error code to come thorugh, but they
> > do not modify behavior based on this code.
> > 
> > In the case of an error code in the IRQ, the handler was returning
> > IRQ_NONE which is not correct:  the IRQ handler was matched
> > to the IRQ.  This mean that multiple error codes returned from
> > a PCC triggered interrupt would end up disabling the device.
> > 
> > In addition, if the error code IRQ was coming from a Type4 Device that was
> > expecting an IRQ response, that device would then be hung.
> > 
> > Fixes: c45ded7e1135 ("mailbox: pcc: Add support for PCCT extended PCC subspaces(type 3/4)")
> Not fix above commit.
> mbox_chan_txdone() was added in below patch.
> Fixes: 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler)
> > Signed-off-by: Adam Young <admiyo@os.amperecomputing.com>
> > 
> > ---
> > ---
> >   drivers/mailbox/pcc.c | 9 +++++----
> >   1 file changed, 5 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/mailbox/pcc.c b/drivers/mailbox/pcc.c
> > index 636879ae1db7..16b9ce087b9e 100644
> > --- a/drivers/mailbox/pcc.c
> > +++ b/drivers/mailbox/pcc.c
> > @@ -314,6 +314,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   {
> >   	struct pcc_chan_info *pchan;
> >   	struct mbox_chan *chan = p;
> > +	int rc;
> >   	pchan = chan->con_priv;
> > @@ -327,8 +328,7 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   	if (!pcc_mbox_cmd_complete_check(pchan))
> >   		return IRQ_NONE;
> > -	if (pcc_mbox_error_check_and_clear(pchan))
> > -		return IRQ_NONE;
> > +	rc = pcc_mbox_error_check_and_clear(pchan);
> 
> I think it is not necessary. This function just return -EIO on failure.
> 
> >   	/*
> >   	 * Clear this flag after updating interrupt ack register and just
> > @@ -337,8 +337,9 @@ static irqreturn_t pcc_mbox_irq(int irq, void *p)
> >   	 * required to avoid any possible race in updatation of this flag.
> >   	 */
> >   	pchan->chan_in_use = false;
> > -	mbox_chan_received_data(chan, NULL);
> > -	mbox_chan_txdone(chan, 0);
> > +	if (!rc)
> > +		mbox_chan_received_data(chan, NULL);
> > +	mbox_chan_txdone(chan, rc);
> @Sudeep, I have always had doubts about the addition of this line of code in
> the
>  commit 9c753f7c953c (mailbox: pcc: Mark Tx as complete in PCC IRQ handler).
> The patch seems to avoid the timeouts in the mailbox core according to its
> commit log.
> Regardless of whether the command succeeds or fails, each mbox client
> driver, like cppc_acpi/acpi_pcc，kunpeng_hccs and so on, is responsible to
> call mbox_chan_txdone() to tell mailbox core.

Few controller drivers do have mbox_chan_txdone(), so Tx complete is detected
by PCC, so not sure why you think this is not the right place to do. The irq
is to indicate the completion. I am confused as why you think otherwise.
It is defined in include/linux/mailbox_controller.h for the same reason.

The client drivers can you mbox_client_txdone() if they wish to as defined
in include/linux/mailbox_client.h

> This is done after executing mbox_chan_received_data(). So I think this line
> in this function is redundant.

No, I think otherwise, see details above.

-- 
Regards,
Sudeep
