Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:35419 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751593AbdCCGxy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Mar 2017 01:53:54 -0500
Date: Fri, 3 Mar 2017 00:21:33 -0600
From: Rob Herring <robh@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Joel Stanley <joel@jms.id.au>, Rick Altherr <raltherr@google.com>,
        Mark Rutland <mark.rutland@arm.com>,
        devicetree@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: Aspeed AST2400/AST2500 ADC
Message-ID: <20170303062133.dvt5g32n26gqio52@rob-hp-laptop>
References: <20170228201404.32125-1-raltherr@google.com>
 <20170228201404.32125-2-raltherr@google.com>
 <CACPK8XfOZiNdrQJaDZcSZkJ4gSZZpGy-r9RQAeykeyUS0yzXMA@mail.gmail.com>
 <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a512cd6c-972b-0a3b-0c2c-5eb18545798a@roeck-us.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Feb 28, 2017 at 07:45:23PM -0800, Guenter Roeck wrote:
> On 02/28/2017 04:49 PM, Joel Stanley wrote:
> > On Wed, Mar 1, 2017 at 6:44 AM, Rick Altherr <raltherr@google.com> wrote:
> > > Aspeed AST2400/AST2500 BMC SoCs include a 16 channel, 10-bit ADC. This
> > > driver implements reading the ADC values, enabling channels via device
> > > tree, and optionally providing channel labels via device tree.  Low and
> > > high threshold interrupts are supported by the hardware but not
> > > implemented.
> > > 
> > > Signed-off-by: Rick Altherr <raltherr@google.com>
> > 
> > Looks good. Some minor comments below.
> > 
> > Is there a reason you wrote a hwmon driver instead of an iio driver? I
> > wasn't sure what the recommended subsystem is.
> 
> Excellent point. Question is really if there is a plan to add support for
> thresholds. If not, an iio driver might be more appropriate.

Sigh. We have ADCs in 2 places? Fine for the kernel I guess, but not 
bindings.

Rob
