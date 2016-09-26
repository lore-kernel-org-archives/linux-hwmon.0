Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58101 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1034437AbcIZM63 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Sep 2016 08:58:29 -0400
Subject: Re: [PATCH] sensors-detect: Report proper processor information on
 ppc
To: Jean Delvare <jdelvare@suse.de>, linux-hwmon@vger.kernel.org
References: <20160926104914.554fb354@endymion>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5f21a1f3-b83f-6ec2-e8eb-5daf4f7b5ff8@roeck-us.net>
Date: Mon, 26 Sep 2016 05:58:21 -0700
MIME-Version: 1.0
In-Reply-To: <20160926104914.554fb354@endymion>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 09/26/2016 01:49 AM, Jean Delvare wrote:
> The format of /proc/cpuinfo on ppc differs from the x86 format. Add
> the missing pieces to the parsing code so that ppc processor
> information is reported properly.
> ---

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

>  prog/detect/sensors-detect |    8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> --- a/prog/detect/sensors-detect
> +++ b/prog/detect/sensors-detect
> @@ -2864,7 +2864,7 @@ sub initialize_cpu_list
>  			};
>  			next;
>  		}
> -		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level)\s*:\s*(.+)$/) {
> +		if (m/^(vendor_id|cpu family|model|model name|stepping|cpuid level|cpu|revision)\s*:\s*(.+)$/) {
>  			my $k = $1;
>  			my $v = $2;
>  			$v =~ s/\s+/ /g;	# Merge multiple spaces
> @@ -2880,7 +2880,11 @@ sub initialize_cpu_list
>  sub print_cpu_info
>  {
>  	my $cpu = $cpu[0];
> -	print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
> +	if (defined  $cpu->{'model name'}) {
> +		print "# Processor: $cpu->{'model name'} ($cpu->{'cpu family'}/$cpu->{model}/$cpu->{stepping})\n";
> +	} elsif (defined $cpu->{'cpu'}) {	# ppc
> +		print "# Processor: $cpu->{'cpu'}, revision $cpu->{'revision'}\n";
> +	}
>  }
>
>  # @i2c_adapters is a list of references to hashes, one hash per I2C/SMBus
>
>

