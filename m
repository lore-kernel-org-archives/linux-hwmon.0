Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36397 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754134AbcKIS0T (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Nov 2016 13:26:19 -0500
Date: Wed, 9 Nov 2016 12:26:17 -0600
From: Rob Herring <robh@kernel.org>
To: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH v4] Documentation: dtb: lm87: Add hwmon binding
 documentation.
Message-ID: <20161109182617.75h6ypgehqwukw3o@rob-hp-laptop>
References: <20161102025804.9215-1-mahoda.ratnayaka@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161102025804.9215-1-mahoda.ratnayaka@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 02, 2016 at 03:58:04PM +1300, Mahoda Ratnayaka wrote:
> This patch adds lm87 hwmon device tree node documentation.
> 
> Signed-off-by: Mahoda Ratnayaka <mahoda.ratnayaka@alliedtelesis.co.nz>
> ---
> 
> Notes:
>     Changes since v1:
>      As suggested include all the changes are moved in
>      to the same patch and the all the optional properties
>      are now defined instead of using a single variable to
>      indicate those properties.
>     
>     Changes since v2:
>      Changed has-vcc-5v to use regulator binding and fixed
>      a minor copy paste mistake.
>     
>     Changes since v3:
>      Update the vcc-supply description.
> 
>  Documentation/devicetree/bindings/hwmon/lm87.txt | 30 ++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/lm87.txt

Acked-by: Rob Herring <robh@kernel.org>
