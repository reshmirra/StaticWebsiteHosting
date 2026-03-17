# StaticWebsiteHosting
Host a static website on Amazon S3, integrating it with Route 53 for domain name resolution, and using CloudFront for content delivery enhances performance, security, and reliability.

Users → Route 53 → CloudFront → private S3 bucket

Amazon S3
Stores your static files such as index.html, CSS, JS, images, and fonts. For the secure design, the bucket is kept private and used as a normal S3 origin, not a public website endpoint.

Amazon CloudFront
Serves content from edge locations, reduces latency, supports HTTPS, lets you attach a custom domain and certificate, and can return custom error responses such as mapping 403/404 to index.html for SPAs.

Amazon Route 53
Hosts your DNS zone and points your domain, including the zone apex like example.com, to the CloudFront distribution using alias records.

AWS Certificate Manager
Provides the TLS certificate for your domain. For CloudFront, the ACM certificate must be requested or imported in us-east-1.